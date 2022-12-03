within EnergyHarvestingWSN.PowerConverter.UnitTests;

model DCDC_Test_C
  extends Modelica.Icons.Example;
  EnergyHarvestingWSN.Utilities.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-60, -18}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.RampVoltage inputVoltage(V = 0, duration = 10, offset = 1) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-60, 22})));
  EnergyHarvestingWSN.PowerConverter.DCDC dcdc(TFB = 1e-5, fixedMPP = 0.5, kFB = 1e-1, param = EnergyHarvestingWSN.Records.DCDC.ideal(), useExternalMPP = false) annotation(
    Placement(transformation(extent = {{-10, 24}, {10, 44}})));
  EnergyHarvestingWSN.EnergyStorages.SuperCap superCap(capParam = EnergyHarvestingWSN.Records.SuperCaps.CapXX_0F4(), Vinit = 5.4) annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Resistor resistor(R = 100) annotation(
    Placement(visible = true, transformation(origin = {80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  EnergyHarvestingWSN.Utilities.IdealDiode idealDiode1 annotation(
    Placement(visible = true, transformation(origin = {26, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(idealDiode1.n, superCap.p) annotation(
    Line(points = {{36, 40}, {40, 40}, {40, 30}, {40, 30}}, color = {0, 0, 255}));
  connect(dcdc.pout, idealDiode1.p) annotation(
    Line(points = {{10, 40}, {16, 40}, {16, 40}, {16, 40}}, color = {0, 0, 255}));
  connect(resistor.p, superCap.p) annotation(
    Line(points = {{80, 30}, {80, 30}, {80, 44}, {40, 44}, {40, 30}, {40, 30}}, color = {0, 0, 255}));
  connect(resistor.n, ground2.p) annotation(
    Line(points = {{80, 10}, {80, 10}, {80, -10}, {40, -10}, {40, -10}}, color = {0, 0, 255}));
  connect(superCap.n, ground2.p) annotation(
    Line(points = {{40, 10}, {40, 10}, {40, -10}, {40, -10}}, color = {0, 0, 255}));
  connect(inputVoltage.n, ground1.p) annotation(
    Line(points = {{-60, 12}, {-60, -8}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(dcdc.pin, inputVoltage.p) annotation(
    Line(points = {{-10, 40}, {-60, 40}, {-60, 32}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(dcdc.n, ground3.p) annotation(
    Line(points = {{0, 24}, {0, -10}}, color = {0, 0, 255}, smooth = Smooth.None));

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end DCDC_Test_C;
