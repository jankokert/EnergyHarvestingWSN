within EnergyHarvestingWSN.EnergyHarvester.Solar;

model SolarModule
  extends EnergyHarvestingWSN.Interfaces.PartialSolar;
  import SI = Modelica.Units.SI;

  parameter Integer ns(min = 1) = 1 "Number of serial connected cells";
  parameter Integer np(min = 1) = 1 "Number of parallel connected cells";
  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarCell cell(final param = param, final A = A) annotation(
    Placement(visible = true, transformation(extent = {{-70, -10}, {-50, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.ScaleVI scaleVI(k_V = ns, k_I = np) annotation(
    Placement(transformation(extent = {{-40, -10}, {-20, 10}})));

equation
  Pirr = irradiance * A * ns * np;
  connect(cell.irradiance, irradiance) annotation(
    Line(points = {{-69, 0}, {-100, 0}}, color = {0, 0, 127}));
  connect(cell.p, scaleVI.p1) annotation(
    Line(points = {{-60, 10}, {-40, 10}}, color = {0, 0, 255}));
  connect(cell.n, scaleVI.n1) annotation(
    Line(points = {{-60, -10}, {-40, -10}}, color = {0, 0, 255}));
  connect(scaleVI.n2, n) annotation(
    Line(points = {{-20, -10}, {0, -10}, {0, -100}}, color = {0, 0, 255}));
  connect(p, scaleVI.p2) annotation(
    Line(points = {{0, 100}, {0, 10}, {-20, 10}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Text(lineColor = {255, 170, 0}, fillColor = {98, 118, 159}, fillPattern = FillPattern.Forward, extent = {{-80, 22}, {80, -22}}, textString = "%ns x %np")}));
end SolarModule;
