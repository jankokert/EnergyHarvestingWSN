within EnergyHarvestingWSN.Applications.SolarDisplay;

model SolarDisplay
  extends Modelica.Icons.Example;
  import SI = Modelica.SIunits;
  EnergyHarvestingWSN.Environment.SolarIrradiation solarIrradiation(colIrr = 10, fileName = "/Resources/USA_CA_San.Francisco.Intl.AP.724940_TMY3.txt") annotation(
    Placement(visible = true, transformation(extent = {{-90, -10}, {-70, 10}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarModuleFOCV solarModule(np = 1, A = 1E-2, param = EnergyHarvestingWSN.Records.SolarCells.StandardSi(), ns = 36) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.DCDC dcdc( fixedMPP = 12, param = EnergyHarvestingWSN.Records.DCDC.LT3652(), useExternalMPP = false, kFB = 0.0001) annotation(
    Placement(transformation(extent = {{-10, 4}, {10, 24}})));
  EnergyStorages.Battery battery(SOCini = 0.5, cellParam = EnergyHarvestingWSN.Records.Batteries.WBLYP40()) annotation(
    Placement(visible = true, transformation(extent = {{40, -10}, {60, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(dcdc.n, ground2.p) annotation(
    Line(points = {{0, 4}, {0, 4}, {0, -20}, {0, -20}}, color = {0, 0, 255}));
  connect(ground1.p, solarModule.n) annotation(
    Line(points = {{-40, -20}, {-40, -10}}, color = {0, 0, 255}));
  connect(solarModule.p, dcdc.pin) annotation(
    Line(points = {{-40, 10}, {-40, 20}, {-10, 20}}, color = {0, 0, 255}));
  connect(battery.n, ground3.p) annotation(
    Line(points = {{50, -10}, {50, -10}, {50, -20}, {50, -20}}, color = {0, 0, 255}));
  connect(solarIrradiation.irrOutput, solarModule.irradiance) annotation(
    Line(points = {{-68, 0}, {-49, 0}}, color = {0, 0, 127}));
  connect(dcdc.pout, battery.p) annotation(
    Line(points = {{10, 20}, {50, 20}, {50, 10}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 100000, Tolerance = 1e-06, Interval = 200));
end SolarDisplay;
