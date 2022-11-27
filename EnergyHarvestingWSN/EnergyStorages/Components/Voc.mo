within EnergyHarvestingWSN.EnergyStorages.Components;
model Voc
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.BottomLabel;
  import SI = Modelica.Units.SI;
  
  Modelica.Blocks.Interfaces.RealInput Q(unit="C") annotation(
      Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0},extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Voc(unit = "C") annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 
  parameter EnergyHarvestingWSN.Records.Batteries.template cellParam annotation(
    Placement(visible = true, transformation(origin = {-80, 84}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  outer Real C;
  
equation
  Voc = cellParam.E0 - 0.2 * (C - Q) / C - cellParam.Epol * C / (Q + 0.01 * C) + cellParam.Av * exp(-cellParam.Bv * (C - Q));

annotation(
    Diagram,
    Icon(graphics = {Line(origin = {0, 100},points = {{0, 50}, {0, 0}}, color = {255, 170, 0}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20), Line(origin = {-70, -65}, points = {{0, 0}, {140, 0}}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 7), Line(origin = {0, -0.796964},points = {{-70, 38}, {-44, 14}, {54, 8}, {61, -28}}, color = {170, 0, 0}, smooth = Smooth.Bezier), Line(origin = {-70, -65}, points = {{0, 0}, {0, 130}}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 7)}));
end Voc;
