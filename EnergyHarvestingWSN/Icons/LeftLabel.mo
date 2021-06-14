within EnergyHarvestingWSN.Icons;
model LeftLabel "Left name label for basic block"

  annotation(
    Icon(graphics = {Text(rotation = -90, lineColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name", fontName = "Arial")},
    coordinateSystem(initialScale = 0.1)));
end LeftLabel;
