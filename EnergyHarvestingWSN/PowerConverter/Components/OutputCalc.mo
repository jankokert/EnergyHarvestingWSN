within EnergyHarvestingWSN.PowerConverter.Components;
model OutputCalc
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.BottomLabel;
  import SI = Modelica.Units.SI;

  parameter EnergyHarvestingWSN.Records.DCDC.template param annotation(
    choicesAllMatching = true, Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  outer SI.Voltage Vout;
  
  Modelica.Blocks.Interfaces.RealInput pout(unit="P") annotation (
    Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput iout(unit="A") annotation(
    Placement(visible = true, transformation(extent = {{100, -10}, {120, 10}}, rotation = 0), iconTransformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));

  SI.Voltage Voutfix;
  
equation
  Voutfix = max(0, Vout) + exp(-max(0, Vout) * 10) / 10;
  iout = pout / Voutfix;
  
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
  Icon(graphics = {Line(origin = {-149.99, 80}, points = {{-30, -20}, {40, -20}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 15), Text(origin = {1, 26}, extent = {{-71, -22}, {71, 22}}, textString = "Pout"), Line(points = {{-70, 0}, {70, 0}}), Text(origin = {3, -28}, extent = {{-71, -22}, {71, 22}}, textString = "Vout'"), Text(origin = {-142, 78}, lineColor = {0, 136, 0}, extent = {{-38, -18}, {38, 18}}, textString = "Vout", horizontalAlignment = TextAlignment.Left)}));
end OutputCalc;
