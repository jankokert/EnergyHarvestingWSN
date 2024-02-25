within EnergyHarvestingWSN.Utilities;
model VariableConductor
  "Ideal linear electrical conductor with variable conductance and Pin measurement"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  import SI = Modelica.Units.SI;

  Modelica.Blocks.Interfaces.RealInput G(final quantity = "Conductance", final unit="S") annotation(
      Placement(transformation(origin = {0,110}, extent = {{-20,-20},{20,20}}, rotation = 270)));
  parameter SI.Conductance Gmin(start = 0) "Min. conductance";
  parameter SI.Conductance Gmax(start = 1000) "Max. conductance";
  SI.Conductance gint;

equation
  gint = min(Gmax, max(Gmin, G));
  i = gint*v;

  annotation(
    Documentation(info = "<html>
<p>The linear conductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by
<br><i><b>i = G*v</b></i>
<br>The Conductance <i>G</i> is given as input signal.
<br><br><b>Attention!!!</b>
<br>It is recommended that the G signal should not cross the zero value. Otherwise depending on the surrounding circuit the probability of singularities is high.</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Line(points = {{-90, 0}, {-70, 0}}, color = {0, 0, 255}), Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-70, 30}, {70, -30}}), Line(points = {{70, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{0, 90}, {0, 30}}, color = {0, 0, 255}), Text(textColor = {0, 0, 255}, extent = {{-148, -41}, {152, -81}}, textString = "%name")}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Line(points = {{0, 90}, {0, 30}}, color = {0, 0, 255}), Line(points = {{-96, 0}, {-70, 0}}, color = {0, 0, 255}), Line(points = {{70, 0}, {96, 0}}, color = {0, 0, 255}), Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-70, 30}, {70, -30}})}));
end VariableConductor;
