within EnergyHarvestingWSN.EnergyHarvester.Solar;

model SolarCell
  extends EnergyHarvestingWSN.Interfaces.PartialSolar;
  import SI = Modelica.Units.SI;
  
  parameter SI.Temperature T = 298;
    
  Modelica.Electrical.Analog.Sources.SignalCurrent photoCurrent (v(start = 1)) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
  EnergyHarvestingWSN.Utilities.Diode d1_Emitter(nideal = cellparam.n1, Ids = cellparam.J01 * A, T=T) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-10, 0})));
  EnergyHarvestingWSN.Utilities.Diode d2_SCR(nideal = cellparam.n2, Ids = cellparam.J02 * A, T=T) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {20, 0})));
  EnergyHarvestingWSN.Utilities.Resistor resistorParallel(R = cellparam.Rp / A) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {50, 0})));
  EnergyHarvestingWSN.Utilities.Resistor resistorSerial(R = cellparam.Rs / A) annotation(
    Placement(transformation(extent = {{60, 10}, {80, 30}})));

equation
  photoCurrent.i = irradiance * A * cellparam.Jsc / onesun;
  Pirr = irradiance * A;
  
  connect(resistorSerial.p, photoCurrent.n) annotation(
    Line(points = {{60, 20}, {-40, 20}, {-40, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(d1_Emitter.p, resistorSerial.p) annotation(
    Line(points = {{-10, 10}, {-10, 20}, {60, 20}}, color = {0, 0, 255}));
  connect(d2_SCR.p, resistorSerial.p) annotation(
    Line(points = {{20, 10}, {20, 20}, {60, 20}}, color = {0, 0, 255}));
  connect(resistorParallel.p, resistorSerial.p) annotation(
    Line(points = {{50, 10}, {50, 20}, {60, 20}}, color = {0, 0, 255}));
  connect(photoCurrent.p, d1_Emitter.n) annotation(
    Line(points = {{-40, -10}, {-40, -20}, {-10, -20}, {-10, -10}}, color = {0, 0, 255}));
  connect(d1_Emitter.n, d2_SCR.n) annotation(
    Line(points = {{-10, -10}, {-10, -20}, {20, -20}, {20, -10}}, color = {0, 0, 255}));
  connect(d2_SCR.n, resistorParallel.n) annotation(
    Line(points = {{20, -10}, {20, -20}, {50, -20}, {50, -10}}, color = {0, 0, 255}));
  connect(resistorParallel.n, n) annotation(
    Line(points = {{50, -10}, {50, -20}, {90, -20}, {90, -80}, {0, -80}, {0, -100}}, color = {0, 0, 255}));
  connect(resistorSerial.n, p) annotation(
    Line(points = {{80, 20}, {90, 20}, {90, 80}, {0, 80}, {0, 100}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Text(origin = {90, -90}, lineColor = {255, 255, 255}, extent = {{-10, 10}, {10, -10}}, textString = "%cellParam", fontSize = 1), Text(origin = {110, -90}, lineColor = {255, 255, 255}, extent = {{-10, 10}, {10, -10}}, textString = "%cellparam")}),
    Documentation(info = "<html><head></head><body>Rule of thumb: 40mA per 1cm² and at 1000W.<div>This is 400A per 1m² and ar 1000W and consequently 0.4A per 1m² and 1W</div></body></html>"));
end SolarCell;
