within EnergyHarvestingWSN.Utilities;
model VariableConductor
  "Ideal linear electrical conductor with variable conductance and Pin measurement"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;

  Modelica.Blocks.Interfaces.RealInput G(unit="S") annotation(
      Placement(transformation(origin = {0,110}, extent = {{-20,-20},{20,20}}, rotation = 270)));
  Modelica.Blocks.Interfaces.RealOutput pin(unit="P") annotation(
    Placement(visible = true, transformation(extent = {{100, 70}, {120, 90}}, rotation = 0), iconTransformation(extent = {{100, 70}, {120, 90}}, rotation = 0)));
equation
  i = max(0, G)*v;
  pin = v*i;

  annotation(
    Documentation(info = "<html>
<p>The linear conductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by
<br><i><b>i = G*v</b></i>
<br>The Conductance <i>G</i> is given as input signal.
<br><br><b>Attention!!!</b>
<br>It is recommended that the G signal should not cross the zero value. Otherwise depending on the surrounding circuit the probability of singularities is high.</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Line(points = {{-90, 0}, {-70, 0}}, color = {0, 0, 255}), Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-70, 30}, {70, -30}}), Line(points = {{70, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{0, 90}, {0, 30}}, color = {0, 0, 255}), Text(lineColor = {0, 0, 255}, extent = {{-148, -41}, {152, -81}}, textString = "%name"), Line(origin = {75, 55}, points = {{25, 25}, {-25, 25}, {-25, -25}}, color = {0, 0, 127}), Ellipse(origin = {55, 50}, lineColor = {0, 0, 255}, fillColor = {245, 245, 245}, fillPattern = FillPattern.Solid, extent = {{-45, -45}, {45, 45}}, endAngle = 360), Ellipse(origin = {55, 50}, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-5, -5}, {5, 5}}, endAngle = 360), Text(origin = {55, 50}, rotation = 90, extent = {{-20, -40}, {20, -5}}, textString = "P"), Polygon(origin = {55, 50}, rotation = 51, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-3, 0}, {-1, 30}, {0, 35}, {1, 30}, {3, 0}, {-3, 0}}), Line(origin = {55, 50}, rotation = 90, points = {{0, 30}, {0, 45}}), Line(origin = {55, 50}, rotation = 62, points = {{0, 30}, {0, 45}}), Line(origin = {55, 50}, rotation = 36, points = {{0, 30}, {0, 45}}), Line(origin = {55, 50}, rotation = 118, points = {{0, 30}, {0, 45}}), Line(origin = {55, 50}, rotation = 146, points = {{0, 30}, {0, 45}})}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Line(points = {{0, 90}, {0, 30}}, color = {0, 0, 255}), Line(points = {{-96, 0}, {-70, 0}}, color = {0, 0, 255}), Line(points = {{70, 0}, {96, 0}}, color = {0, 0, 255}), Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-70, 30}, {70, -30}}), Line(origin = {75, 55}, points = {{25, 25}, {-25, 25}, {-25, -25}}, color = {0, 0, 127})}));
end VariableConductor;
