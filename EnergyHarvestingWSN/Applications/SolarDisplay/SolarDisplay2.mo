within EnergyHarvestingWSN.Applications.SolarDisplay;

model SolarDisplay2
  extends Modelica.Icons.Example;
  import SI = Modelica.Units.SI;
  
  EnergyHarvestingWSN.Environment.SolarIrradiation solarIrradiation(colIrr = 10, fileName = "/Resources/USA_CA_San.Francisco.Intl.AP.724940_TMY3.txt") annotation(
    Placement(visible = true, transformation(extent = {{-90, -10}, {-70, 10}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarModuleFOCV solarModule(np = 1, A = 1E-2, param = EnergyHarvestingWSN.Records.SolarCells.StandardSi(), ns = 36) annotation(
    Placement(visible = true, transformation(extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.DCDC dcdc(TFB = 1e-4, kFB = 1e-4, param = EnergyHarvestingWSN.Records.DCDC.LT3652(), useExternalMPP = true) annotation(
    Placement(transformation(extent = {{-10, 4}, {10, 24}})));
  EnergyHarvestingWSN.Utilities.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyLoads.PeriodicCurrent load(fixedPeriod = 30, offCurrent = 1e-6, onCurrent = 0.1, onTime = 1, useExternalPeriod = false) annotation(
    Placement(visible = true, transformation(extent = {{80, -10}, {100, 10}}, rotation = 0)));

equation
  connect(solarModule.irradiance, solarIrradiation.irrOutput) annotation(
    Line(points = {{-49, 0}, {-70, 0}}, color = {0, 0, 127}));
  connect(dcdc.pin, solarModule.p) annotation(
    Line(points = {{-10, 20}, {-40, 20}, {-40, 10}}, color = {0, 0, 255}));
  connect(dcdc.pout, load.p) annotation(
    Line(points = {{10, 20}, {90, 20}, {90, 10}}, color = {0, 0, 255}));
  connect(solarModule.vMPP, dcdc.extMPP) annotation(
    Line(points = {{-32, 0}, {-20, 0}, {-20, 14}, {-10, 14}}, color = {0, 0, 127}));
  connect(solarModule.n, ground1.p) annotation(
    Line(points = {{-40, -10}, {-40, -20}}, color = {0, 0, 255}));
  connect(dcdc.n, ground2.p) annotation(
    Line(points = {{0, 4}, {0, 4}, {0, -20}, {0, -20}}, color = {0, 0, 255}));
  connect(load.n, ground3.p) annotation(
    Line(points = {{90, -10}, {90, -20}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 100000, Tolerance = 1e-6, Interval = 200));
end SolarDisplay2;
