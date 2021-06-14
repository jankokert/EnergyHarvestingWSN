within EnergyHarvestingWSN.Icons;
class SolarIrradiation "Icon for solar irradiation"
  extends EnergyHarvestingWSN.Icons.Block;
  
  annotation(
    Icon(graphics = {
    Rectangle(origin = {0, -10}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-80, 48}, {80, -48}}),
    Line(origin = {-8, -20},points = {{-60, 50}, {-20, -30}}, color = {244, 228, 0}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10),
    Line(origin = {-6, -20},points = {{-40, 50}, {0, -30}}, color = {244, 228, 0}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10),
    Line(origin = {-4, -20},points = {{-20, 50}, {20, -30}}, color = {244, 228, 0}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10),
    Line(origin = {-1.66, -20},points = {{0, 50}, {40, -30}}, color = {244, 228, 0}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10),
    Line(origin = {0.34, -20},points = {{20, 50}, {62, -30}}, color = {244, 228, 0}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10),
    Text(fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-80, 90}, {80, 60}}, textString = "Irradiation", fontName = "Arial"),
    Line(origin = {0, -18},points = {{-80, -40}, {80, -40}}, thickness = 0.5)},
    coordinateSystem(initialScale = 0.1)));
end SolarIrradiation;
