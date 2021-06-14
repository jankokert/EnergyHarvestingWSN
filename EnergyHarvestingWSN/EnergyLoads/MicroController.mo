within EnergyHarvestingWSN.EnergyLoads;
model MicroController
  extends EnergyHarvestingWSN.Icons.IC1;
  extends EnergyHarvestingWSN.Interfaces.TwoPin;
  
  parameter Records.MicroControllers.template mcparam annotation(__Dymola_choicesAllMatching = true, Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  
  Modelica.Blocks.Interfaces.RealInput dutyCycle annotation(
    Placement(transformation(extent = {{-120, 30}, {-100, 50}})));
  Modelica.Blocks.Interfaces.RealInput frequency annotation(
    Placement(transformation(extent = {{-120, -50}, {-100, -30}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation(
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {-60, 0})));
  Modelica.Blocks.Interfaces.BooleanOutput isOpSafely annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}})));

  Calculators.CurrentLossAM currentLossAM(c1 = mcparam.c1AM, c2 = mcparam.c2AM, c3 = mcparam.c3AM) annotation(
    Placement(transformation(extent = {{-30, -10}, {-10, 10}})));
  Calculators.CurrentLossLPM currentLossLPM(c1 = mcparam.c1LPM) annotation(
    Placement(transformation(extent = {{-30, -40}, {-10, -20}})));
  Calculators.SafeOperation safeOperation(saveOpTable = mcparam.saveOpTable) annotation(
    Placement(transformation(extent = {{-30, 50}, {-10, 70}})));
  DutyCurrent dutyCurrent annotation(
    Placement(transformation(extent = {{30, -10}, {50, 10}})));

equation
  connect(dutyCurrent.vdd, voltageSensor.p) annotation(
    Line(points = {{40, 10}, {40, 80}, {-60, 80}, {-60, 10}}, color = {0, 0, 255}));
  connect(n, voltageSensor.n) annotation(
    Line(points = {{0, -100}, {0, -80}, {-60, -80}, {-60, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(voltageSensor.v, currentLossAM.Vdd) annotation(
    Line(points = {{-50, -1.77636e-015}, {-50, 0}, {-31, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(p, voltageSensor.p) annotation(
    Line(points = {{0, 100}, {0, 80}, {-60, 80}, {-60, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(frequency, currentLossAM.f) annotation(
    Line(points = {{-110, -40}, {-38, -40}, {-38, -4}, {-31, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(safeOperation.Vdd, currentLossAM.Vdd) annotation(
    Line(points = {{-31, 60}, {-44, 60}, {-44, 0}, {-31, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(safeOperation.f, currentLossAM.f) annotation(
    Line(points = {{-31, 56}, {-38, 56}, {-38, -4}, {-31, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(safeOperation.y, isOpSafely) annotation(
    Line(points = {{-9, 60}, {80, 60}, {80, 0}, {110, 0}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(dutyCurrent.gnd, voltageSensor.n) annotation(
    Line(points = {{40, -10}, {40, -80}, {-60, -80}, {-60, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(dutyCurrent.dutyCycle, dutyCycle) annotation(
    Line(points = {{34, 6}, {26, 6}, {26, 40}, {-110, 40}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(dutyCurrent.activeCurrent, currentLossAM.i) annotation(
    Line(points = {{34, 0}, {-9, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(dutyCurrent.sleepCurrent, currentLossLPM.i) annotation(
    Line(points = {{34, -4}, {12, -4}, {12, -30}, {-9, -30}}, color = {0, 0, 127}, smooth = Smooth.None));

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1)));
end MicroController;
