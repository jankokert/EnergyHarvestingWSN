within EnergyHarvestingWSN.PowerConverter.Components;
model Feedback
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.BottomLabel;
  import SI = Modelica.Units.SI;

  parameter EnergyHarvestingWSN.Records.DCDC.template param annotation(
    choicesAllMatching = true, Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  outer SI.Voltage Vin, Vout;
  outer SI.Current Iin, Iout, Iset;
  outer SI.Voltage Vmpp, Vset;
  outer Boolean isOn;
  
  Modelica.Blocks.Interfaces.RealOutput fb annotation(
    Placement(visible = true, transformation(extent = {{100, -10}, {120, 10}}, rotation = 0), iconTransformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));

  Real fbVin, fbVout, fbIout;
  
equation
  // adding 0.1% is needed to not trigger the mpp assert falsely due to numeric errors.
  fbVin = Vin - max(Vmpp, param.Vmin) * 1.001;
  fbVout = Vset - Vout;
  fbIout = Iset - Iout;
  // if fb = 0 then dG = 0 and thus G is not adjusted any longer
  // to not integrate errors during off state, fb needs to be 0
  fb = if isOn then min(fbVin, min(fbVout, fbIout)) else 0;
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
  Icon(graphics = {Line(origin = {-150, 60}, points = {{-40, 0}, {40, 0}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 15), Text(origin = {-145, 79}, lineColor = {0, 136, 0}, extent = {{-45, -19}, {45, 19}}, textString = "Vin", horizontalAlignment = TextAlignment.Left), Line(origin = {-150, 0}, points = {{-40, 0}, {40, 0}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 15), Text(origin = {-145, 21}, lineColor = {0, 136, 0}, extent = {{-45, -19}, {45, 19}}, textString = "Vout", horizontalAlignment = TextAlignment.Left), Line(points = {{-95, 0}, {-30, 0}}, color = {0, 136, 0}, arrowSize = 10), Line(points = {{0, 0}, {95, 0}}, color = {0, 0, 255}), Line(origin = {-10.48, 0}, points = {{0, 179}, {0, -40}}, color = {255, 170, 0}, arrowSize = 10), Text(origin = {-66.75, 18.7629}, extent = {{-3.25, 7.23713}, {22.75, -60.7628}}, textString = "-"), Ellipse(origin = {-11, 0}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Rectangle(origin = {60, 0}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-30, 30}, {30, -30}}), Ellipse(origin = {-11, -60}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Text(origin = {60, 0}, extent = {{-30, 18}, {30, -18}}, textString = "min"), Text(origin = {-145, -39}, lineColor = {0, 136, 0}, extent = {{-45, -19}, {45, 19}}, textString = "Iout", horizontalAlignment = TextAlignment.Left), Line(origin = {-150, -60}, points = {{-40, 0}, {40, 0}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 15), Text(origin = {-66.75, -41.2371}, extent = {{-3.25, 7.23713}, {22.75, -60.7628}}, textString = "-"), Line(origin = {0, -60}, points = {{-95, 0}, {-30, 0}}, color = {0, 136, 0}, arrowSize = 10), Ellipse(origin = {-11, 60}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Text(origin = {-66.75, 78.7629}, extent = {{-3.25, 7.23713}, {22.75, -60.7628}}, textString = "-"), Line(origin = {0, 60}, points = {{-95, 0}, {-30, 0}}, color = {0, 136, 0}, arrowSize = 10)}));
end Feedback;
