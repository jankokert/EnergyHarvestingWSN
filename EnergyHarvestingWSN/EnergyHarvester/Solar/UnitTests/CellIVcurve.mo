within EnergyHarvestingWSN.EnergyHarvester.Solar.UnitTests;

model CellIVcurve
  extends Modelica.Icons.Example;
  
  parameter Real tscale = 10;
  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarCell solarCell(A = 0.0001, param = EnergyHarvestingWSN.Records.SolarCells.StandardSi()) annotation(
    Placement(transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}})));
  EnergyHarvestingWSN.Utilities.Ground ground annotation(
    Placement(transformation(origin = {-20, -38}, extent = {{-10, -10}, {10, 10}})));
  EnergyHarvestingWSN.Utilities.VariableConductor load annotation(
    Placement(transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression irradiance(y = 1000) annotation(
    Placement(transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}})));

equation
  load.G = tscale*time;
  connect(solarCell.n, ground.p) annotation(
    Line(points = {{-20, -10}, {-20, -28}}, color = {0, 0, 255}));
  connect(load.n, ground.p) annotation(
    Line(points = {{20, -10}, {20, -20}, {-20, -20}, {-20, -28}}, color = {0, 0, 255}));
  connect(solarCell.p, load.p) annotation(
    Line(points = {{-20, 10}, {-20, 20}, {20, 20}, {20, 10}}, color = {0, 0, 255}));
  connect(irradiance.y, solarCell.irradiance) annotation(
    Line(points = {{-38, 0}, {-28, 0}}, color = {0, 0, 127}));

annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.0001));
end CellIVcurve;
