within EnergyHarvestingWSN.Utilities;
model Resistor "Ideal linear electrical resistor w/o temperature dependance"  
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  
  parameter Modelica.Units.SI.Resistance R(start = 1) "Resistance";
  Modelica.Units.SI.Power LossPower;
  
equation
  v = R * i;
  LossPower = v * i;
  
  annotation(
    Documentation(info = "<html>
 <p>The linear resistor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i*R = v</i>. The Resistance <i>R</i> is allowed to be positive, zero, or negative.
 In this model the temperature dependance is removed to simpyfy the resulting equation system.</p>
 </html>"),
   Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics={
   Rectangle(extent = {{-70, 30}, {70, -30}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid),
   Line(points = {{-90, 0}, {-70, 0}}, color = {0, 0, 255}),
   Line(points = {{70, 0}, {90, 0}}, color = {0, 0, 255}),
   Text(extent = {{-144, -40}, {142, -72}}, lineColor = {0, 0, 0}, textString = "R=%R"),
   Text(extent={{-120,70},{120,30}}, textString = "%name", lineColor = {0, 0, 255})}),
   Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics={
   Rectangle(extent=  {{-70, 30}, {70, -30}}, lineColor = {0, 0, 255}),
   Line(points = {{-96, 0}, {-70, 0}}, color = {0, 0, 255}),
   Line(points = {{70, 0}, {96, 0}}, color = {0, 0, 255})}));
end Resistor;
