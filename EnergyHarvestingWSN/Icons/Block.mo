within EnergyHarvestingWSN.Icons;
class Block "Icon for a basic block"

  annotation(
    Icon(graphics = {
    Rectangle(lineColor = {0, 0, 255}, fillColor = {95, 95, 95}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}),
    Rectangle(lineColor = {0, 0, 255}, fillColor = {230, 230, 230}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{95, -95}, {-95, 95}})},
    coordinateSystem(initialScale = 0.1)));
end Block;
