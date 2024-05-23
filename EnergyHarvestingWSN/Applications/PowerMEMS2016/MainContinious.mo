within EnergyHarvestingWSN.Applications.PowerMEMS2016;
model MainContinious
  extends Modelica.Icons.Example;
  import SI = Modelica.Units.SI;
  EnergyHarvester.Solar.SolarCellFOCV solarCell(A = 6.67e-5, param = Records.SolarCells.DiscretOneDiode(), k_FOCV = 0.8) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Environment.StandardDay standardDay(timeOffset = 21600) annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Utilities.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Utilities.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Utilities.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyLoads.DutyResistorParam dummyLoad(activeResistor = 100, sleepResistor = 100000) annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerManagement1 powerManagement(useExternalMPP = true) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression dutyCylce(y = 0.01) annotation(
    Placement(transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}})));

equation
  powerManagement.Pharv = 210/86400; // todo: replace with ideal MPPT

  connect(standardDay.irr, solarCell.irradiance) annotation(
    Line(points = {{-68, 0}, {-50, 0}, {-50, 0}, {-50, 0}}, color = {0, 0, 127}));
  connect(solarCell.p, powerManagement.pin) annotation(
    Line(points = {{-40, 10}, {-40, 10}, {-40, 16}, {-10, 16}, {-10, 16}}, color = {0, 0, 255}));
  connect(powerManagement.pout, dummyLoad.p) annotation(
    Line(points = {{10, 16}, {60, 16}, {60, 10}, {60, 10}}, color = {0, 0, 255}));
  connect(solarCell.n, ground1.p) annotation(
    Line(points = {{-40, -10}, {-40, -10}, {-40, -20}, {-40, -20}}, color = {0, 0, 255}));
  connect(powerManagement.n, ground2.p) annotation(
    Line(points = {{0, 0}, {0, 0}, {0, -20}, {0, -20}}, color = {0, 0, 255}));
  connect(dummyLoad.n, ground3.p) annotation(
    Line(points = {{60, -10}, {60, -10}, {60, -20}, {60, -20}}, color = {0, 0, 255}));
  connect(solarCell.vMPP, powerManagement.extMPP) annotation(
    Line(points = {{-32, 0}, {-22, 0}, {-22, 10}, {-10, 10}}, color = {0, 0, 127}));
  connect(dutyCylce.y, dummyLoad.dutyCycle) annotation(
    Line(points = {{41, 0}, {54, 0}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 100),
    Diagram);
end MainContinious;
