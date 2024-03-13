within EnergyHarvestingWSN.EnergyHarvester.Solar;

model SolarModule
  extends EnergyHarvestingWSN.Interfaces.PartialSolar;
  import SI = Modelica.Units.SI;

  parameter Integer ns(min = 1) = 1 "Number of serial connected cells";
  parameter Integer np(min = 1) = 1 "Number of parallel connected cells";
  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarCell cell(final param = param, final A = A) annotation(
    Placement(visible = true, transformation(extent = {{-70, -10}, {-50, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.CellStack stack(ns = ns, np = np) annotation(
    Placement(transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}})));

equation
  Pirr = irradiance * A * ns * np;
  connect(cell.irradiance, irradiance) annotation(
    Line(points = {{-69, 0}, {-100, 0}}, color = {0, 0, 127}));
  connect(cell.n, stack.n) annotation(
    Line(points = {{-60, -10}, {-60, -20}, {-30, -20}, {-30, 0}}, color = {0, 0, 255}));
  connect(stack.n, n) annotation(
    Line(points = {{-30, 0}, {-30, -20}, {0, -20}, {0, -100}}, color = {0, 0, 255}));
  connect(p, stack.pout) annotation(
    Line(points = {{0, 100}, {0, 16}, {-20, 16}}, color = {0, 0, 255}));
  connect(stack.pin, cell.p) annotation(
    Line(points = {{-40, 16}, {-60, 16}, {-60, 10}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Text(lineColor = {255, 170, 0}, fillColor = {98, 118, 159}, fillPattern = FillPattern.Forward, extent = {{-80, 22}, {80, -22}}, textString = "%ns x %np")}));
end SolarModule;
