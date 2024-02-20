within EnergyHarvestingWSN.Utilities;

block Gain "Mockup of gain"
  parameter Real k(start = 1, unit = "1") "Gain value multiplied with input signal";
public
  Modelica.Blocks.Interfaces.RealInput u "Input signal connector" annotation(
    Placement(transformation(extent = {{-140, -20}, {-100, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y "Output signal connector" annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}})));
equation

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100, -100}, {-100, 100}, {100, 0}, {-100, -100}}), Text(extent = {{-200, -140}, {200, -100}}, textString = "k=%k"), Text(textColor = {0, 0, 255}, extent = {{-150, 150}, {150, 90}}, textString = "%name")}));
end Gain;
