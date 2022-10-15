within EnergyHarvestingWSN.PowerConverter.UnitTests;

model DCDC_Test_R
  extends Modelica.Icons.Example;
  EnergyHarvestingWSN.Utilities.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-40, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {40, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.RampVoltage inputVoltage(V = 10, duration = 10, offset = 0) annotation(
    Placement(visible = true, transformation(origin = {-40, 22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  EnergyHarvestingWSN.PowerConverter.DCDC dcdc(TFB = 0.0001, kFB = 0.01, param = EnergyHarvestingWSN.Records.DCDC.ideal()) annotation(
    Placement(transformation(extent = {{-10, 24}, {10, 44}})));
  Modelica.Electrical.Analog.Basic.VariableResistor load annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));

  
equation
  load.R = 1 + max(time - 3, 0);
  connect(inputVoltage.n, ground1.p) annotation(
    Line(points = {{-40, 12}, {-40, 2}}, color = {0, 0, 255}));
  connect(dcdc.pin, inputVoltage.p) annotation(
    Line(points = {{-10, 40}, {-40, 40}, {-40, 32}}, color = {0, 0, 255}));
  connect(dcdc.n, ground3.p) annotation(
    Line(points = {{0, 24}, {0, 0}}, color = {0, 0, 255}));
  connect(dcdc.pout, load.n) annotation(
    Line(points = {{10, 40}, {40, 40}, {40, 30}}, color = {0, 0, 255}));
  connect(load.p, ground2.p) annotation(
    Line(points = {{40, 10}, {40, 0}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end DCDC_Test_R;
