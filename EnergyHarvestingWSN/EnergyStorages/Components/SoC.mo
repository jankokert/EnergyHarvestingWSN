within EnergyHarvestingWSN.EnergyStorages.Components;
model SoC
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.BottomLabel;
  import SI = Modelica.Units.SI;
     
  Modelica.Blocks.Interfaces.RealInput Q(unit="C") annotation(
      Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0},extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput SoC() annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  outer Real C;
  
equation
  SoC = Q / C;

annotation(
    Diagram,
    Icon(graphics = {Text(origin = {-1, 50}, extent = {{-75, -25}, {75, 25}}, textString = "SoC ="), Line(origin = {0, -38}, points = {{-35, 0}, {35, 0}}), Text(origin = {1, -10}, extent = {{-71, -22}, {71, 22}}, textString = "Q"), Text(origin = {0, -64}, extent = {{-71, -22}, {71, 22}}, textString = "C")}));
end SoC;
