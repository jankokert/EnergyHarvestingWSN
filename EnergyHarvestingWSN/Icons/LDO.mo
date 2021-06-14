within EnergyHarvestingWSN.Icons;
class LDO "Icon for low dropout (LDO) converter"
  extends EnergyHarvestingWSN.Icons.TopLabel;
  extends EnergyHarvestingWSN.Icons.Block;
  
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Text(origin = {-85, 60}, fillPattern = FillPattern.Solid, extent = {{0, -20}, {50, 20}}, textString = "IN", fontName = "Arial", horizontalAlignment = TextAlignment.Left), Text(origin = {0, -70}, fillPattern = FillPattern.Solid, extent = {{-50, -20}, {50, 20}}, textString = "GND", fontName = "Arial"), Text(origin = {-5, 9}, extent = {{-53, 23}, {67, -37}}, textString = "LDO", fontName = "Arial"), Text(origin = {80, 60}, fillPattern = FillPattern.Solid, extent = {{-100, -20}, {0, 20}}, textString = "OUT", fontName = "Arial", horizontalAlignment = TextAlignment.Right)}));
end LDO;
