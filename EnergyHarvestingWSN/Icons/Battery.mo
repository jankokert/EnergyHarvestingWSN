within EnergyHarvestingWSN.Icons;
class Battery "Icon for a battery"

  annotation(
    Icon(graphics = {
    Line(points = {{-54, -100}, {54, -100}, {48, -100}}),
    Line(points = {{-54, -100}, {-54, 80}, {-20, 80}, {-20, 100}, {20, 100}, {20, 80}, {54, 80}, {54, -100}}),
    Text(fillColor = {0, 127, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, 60}}, textString = "+"),
    Polygon(lineColor = {0, 0, 255}, fillColor = {0, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-50, 56}, {50, 76}, {50, -96}, {-50, -96}, {-50, 56}}),
    Text(lineColor = {0, 0, 255}, fillColor = {122, 255, 107}, fillPattern = FillPattern.Solid, extent = {{20, 118}, {182, 84}}, textString = "%name", fontName = "Arial")},
    coordinateSystem(initialScale = 0.1)));
end Battery;
