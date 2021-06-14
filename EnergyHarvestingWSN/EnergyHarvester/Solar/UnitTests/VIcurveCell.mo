within EnergyHarvestingWSN.EnergyHarvester.Solar.UnitTests;

model VIcurveCell
  extends Modelica.Icons.Example;
  
  parameter Real tscale = 10;
  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarCell solarCell(A = 0.0001, cellparam = EnergyHarvestingWSN.Records.SolarCells.StandardSi()) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground annotation(
    Placement(visible = true, transformation(origin = {40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.VariableConductor load annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

equation
  solarCell.irradiance = 1000;
  load.G = tscale*time;
  connect(solarCell.n, ground.p) annotation(
    Line(points = {{-40, -10}, {-40, -20}, {40, -20}, {40, -40}}, color = {0, 0, 255}));
  connect(load.n, ground.p) annotation(
    Line(points = {{40, -10}, {40, -40}}, color = {0, 0, 255}));
  connect(solarCell.p, load.p) annotation(
    Line(points = {{-40, 10}, {-40, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.0001));
end VIcurveCell;
