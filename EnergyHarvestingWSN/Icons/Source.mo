within EnergyHarvestingWSN.Icons;
class Source "Icon for an electrical source"
  extends EnergyHarvestingWSN.Icons.Block;
  
  annotation(
    Icon(graphics = {
    Ellipse( rotation = 90, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}, endAngle = 360),
    Line( rotation = 90, points = {{0, 40}, {0, -40}}),
    Polygon(origin = {0, 60}, rotation = 180, fillPattern = FillPattern.Solid, points = {{0, -10}, {-8, 8}, {8, 8}, {0, -10}}), 
    Line(points = {{0, 98}, {0, 40}}),
    Line(points = {{0, -40}, {0, -98}})},
    coordinateSystem(initialScale = 0.1)));
end Source;
