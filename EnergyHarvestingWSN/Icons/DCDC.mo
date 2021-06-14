within EnergyHarvestingWSN.Icons;
class DCDC "Icon for a dc-dc converter"
  extends EnergyHarvestingWSN.Icons.TopLabel;
  extends EnergyHarvestingWSN.Icons.Block;
  
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {
    Text(origin = {-40, 45}, fillPattern = FillPattern.Solid, extent = {{-50, -25}, {50, 25}}, textString = "DC", fontName = "Arial"),
    Text(origin = {40, -45}, fillPattern = FillPattern.Solid, extent = {{-50, -25}, {50, 25}}, textString = "DC", fontName = "Arial"),
    Polygon(fillColor = {95, 95, 95}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-100, -100}, {-100, -96}, {96, 100}, {100, 100}, {100, 96}, {-96, -100}, {-100, -100}})}));
end DCDC;
