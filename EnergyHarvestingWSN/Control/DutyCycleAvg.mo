within EnergyHarvestingWSN.Control;
block DutyCycleAvg
  extends EnergyHarvestingWSN.Icons.Block;
  parameter Real activeTime = 0.1;
  parameter Real periode = 60;
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}})));

equation
  y = activeTime / periode;
  
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={
    Text(extent = {{-68, 26}, {66, 8}}, pattern = LinePattern.None, textString = "active", lineColor = {0, 0, 0}),
    Text(extent = {{-80, 80}, {80, 40}}, textString = "duty cycle", pattern = LinePattern.None),
    Line(points = {{-68, 0}, {66, 0}}, color = {0, 0, 255}, smooth = Smooth.None),
    Text(extent = {{-68, -12}, {66, -30}}, lineThickness = 1, pattern = LinePattern.None, textString = "periode", lineColor = {0, 0, 0})}));
end DutyCycleAvg;
