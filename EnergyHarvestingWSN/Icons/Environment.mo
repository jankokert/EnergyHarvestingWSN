within EnergyHarvestingWSN.Icons;
class Environment "Icon for the environment"

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, initialScale = 0.1), graphics={
    Rectangle(lineColor = {0, 0, 255}, fillColor = {170, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 100}, {100, -100}}),
    Rectangle(fillColor = {0, 127, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, -20}, {100, -100}}),
    Ellipse(fillColor = {255, 255, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-76, 84}, {-36, 44}}, endAngle = 360)}));
end Environment;
