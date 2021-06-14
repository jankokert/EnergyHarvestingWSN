within EnergyHarvestingWSN.PowerConverter.UnitTests;
model DCDC_Test_Ri_R
  extends Modelica.Icons.Example;
  EnergyHarvestingWSN.Utilities.Ground ground1 annotation(
  Placement(visible = true, transformation(origin={-80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.RampVoltage inputVoltage(V = -10, duration = 10, offset = 10)                                                                        annotation(Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.VariableResistor load annotation(
    Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin = {40,20})));

  EnergyHarvestingWSN.PowerConverter.DCDC dcdc(TFB = 0.0001, kFB = 0.1, param = EnergyHarvestingWSN.Records.DCDC.ideal()) annotation(
    Placement(transformation(extent={{-10,24},{10,44}})));
  EnergyHarvestingWSN.Utilities.Resistor ri(R = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  load.R = 1+max(time-3, 0);
  
  connect(ri.p, dcdc.pin) annotation(
    Line(points = {{-30, 40}, {-10, 40}, {-10, 40}, {-10, 40}}, color = {0, 0, 255}));
  connect(ri.n, inputVoltage.p) annotation(
    Line(points = {{-50, 40}, {-80, 40}, {-80, 30}, {-80, 30}, {-80, 30}}, color = {0, 0, 255}));
  connect(inputVoltage.n, ground1.p) annotation(
    Line(points = {{-80, 10}, {-80, -10}}, color = {0, 0, 255}));
  connect(load.p, ground2.p) annotation(
    Line(points = {{40,10},{40,-10}}, color={0,0,255}, smooth = Smooth.None));
  connect(dcdc.n, ground3.p) annotation(
    Line(points = {{0,24},{0,-10}}, color = {0,0,255}, smooth = Smooth.None));
  connect(dcdc.pout, load.n) annotation(
    Line(points = {{10,40},{40,40},{40,30}}, color = {0,0,255}, smooth = Smooth.None));
  
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end DCDC_Test_Ri_R;
