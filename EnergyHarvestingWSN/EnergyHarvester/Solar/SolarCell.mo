within EnergyHarvestingWSN.EnergyHarvester.Solar;

model SolarCell
  extends EnergyHarvestingWSN.Interfaces.PartialSolar;
  import SI = Modelica.Units.SI;
  
  Modelica.Electrical.Analog.Sources.SignalCurrent photoCurrent (v(start = 1)) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
  EnergyHarvestingWSN.Utilities.Diode d1_Emitter(nideal = cellparam.n1, Ids = cellparam.J01 * A) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-10, 0})));
  EnergyHarvestingWSN.Utilities.Diode d2_SCR(nideal = cellparam.n2, Ids = cellparam.J02 * A) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {20, 0})));
  EnergyHarvestingWSN.Utilities.Resistor resistorParallel(R = cellparam.Rp / A) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {50, 0})));
  EnergyHarvestingWSN.Utilities.Resistor resistorSerial(R = cellparam.Rs / A) annotation(
    Placement(transformation(extent = {{60, 10}, {80, 30}})));

equation
  photoCurrent.i = irradiance * A * Jsc;
  Pirr = irradiance * A;
  
  connect(resistorSerial.n, p) annotation(
    Line(points = {{80, 20}, {90, 20}, {90, 40}, {0, 40}, {0, 98}, {0, 98}, {0, 100}}, color = {0, 0, 255}));
  connect(n, resistorParallel.n) annotation(
    Line(points = {{0, -100}, {0, -100}, {0, -20}, {50, -20}, {50, -10}, {50, -10}}, color = {0, 0, 255}));
  connect(resistorSerial.p, photoCurrent.n) annotation(
    Line(points = {{60, 20}, {-40, 20}, {-40, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(d1_Emitter.p, photoCurrent.n) annotation(
    Line(points = {{-10, 10}, {-10, 20}, {-40, 20}, {-40, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(d2_SCR.p, photoCurrent.n) annotation(
    Line(points = {{20, 10}, {20, 20}, {-40, 20}, {-40, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(d1_Emitter.n, photoCurrent.p) annotation(
    Line(points = {{-10, -10}, {-10, -20}, {-40, -20}, {-40, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(d2_SCR.n, photoCurrent.p) annotation(
    Line(points = {{20, -10}, {20, -20}, {-40, -20}, {-40, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistorParallel.p, photoCurrent.n) annotation(
    Line(points = {{50, 10}, {50, 20}, {-40, 20}, {-40, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(resistorParallel.n, photoCurrent.p) annotation(
    Line(points = {{50, -10}, {50, -20}, {-40, -20}, {-40, -10}}, color = {0, 0, 255}, smooth = Smooth.None));

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Text(origin = {90, -90}, lineColor = {255, 255, 255}, extent = {{-10, 10}, {10, -10}}, textString = "%cellParam", fontSize = 1), Text(origin = {110, -90}, lineColor = {255, 255, 255}, extent = {{-10, 10}, {10, -10}}, textString = "%cellparam")}),
    Documentation(info = "<html><head></head><body>Rule of thumb: 40mA per 1cm?? and at 1000W.<div>This is 400A per 1m?? and ar 1000W and consequently 0.4A per 1m?? and 1W</div></body></html>"));
end SolarCell;
