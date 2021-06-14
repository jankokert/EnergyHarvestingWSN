within EnergyHarvestingWSN.EnergyHarvester.Solar.UnitTests;

model VIcurveModule
  extends Modelica.Icons.Example;

  parameter Real tscale = 0.1;
  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarModule solarModule(A = 0.0001,cellparam = EnergyHarvestingWSN.Records.SolarCells.StandardSi(), np = 1, ns = 36) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground annotation(
    Placement(visible = true, transformation(origin = {40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.VariableConductor load annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

equation
  solarModule.irradiance = 1000;
  load.G = tscale*time;
  connect(load.n, ground.p) annotation(
    Line(points = {{40, -10}, {40, -40}}, color = {0, 0, 255}));
  connect(solarModule.n, ground.p) annotation(
    Line(points = {{-40, -10}, {-40, -20}, {40, -20}, {40, -40}}, color = {0, 0, 255}));
  connect(solarModule.p, load.p) annotation(
    Line(points = {{-40, 10}, {-40, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.0001));
end VIcurveModule;
