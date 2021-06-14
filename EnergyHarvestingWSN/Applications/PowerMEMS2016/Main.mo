within EnergyHarvestingWSN.Applications.PowerMEMS2016;
model Main
  extends Modelica.Icons.Example;
  import SI = Modelica.Units.SI;
  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarCellFOCV solarCell(A = 6.66e-05, Jsc = 0.3, cellparam = EnergyHarvestingWSN.Records.SolarCells.StandardSi()) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Environment.StandardDay standardDay(timeOffset = 21600) annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  EnergyLoads.PeriodicCurrent dummyLoad(fixedPeriod = 30, offCurrent = 0.000033, onCurrent = 0.033, onTime = 0.3, useExternalPeriod = false, vcalc = 3.3) annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerManagement1 powerManagement annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation

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
  connect(solarCell.vMPP, powerManagement.energyInfo.Vmpp) annotation(
    Line(points = {{-32, 0}, {-28, 0}, {-28, 28}, {0, 28}, {0, 20}}, color = {255, 170, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 100),
    Diagram);
end Main;
