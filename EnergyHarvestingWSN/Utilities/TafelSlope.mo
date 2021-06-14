within EnergyHarvestingWSN.Utilities;

model TafelSlope "A load with tafel slope (no temperature dependance)"  
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  
  parameter Modelica.SIunits.Current i0 = 3.2E-5 "exchange current at v0";
  parameter Modelica.SIunits.Voltage v0 = 2.7 "voltage at i0";
  parameter Modelica.SIunits.Voltage b = 0.25 "tafel slope (voltage per decade)";
  
equation
  i = i0 * 10^((v-v0)/b);
  // v-v0 = b * log(i/i0); a*z = 17
  
  annotation(
    Documentation(info = "<html>
 <p>The linear resistor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i*R = v</i>. The Resistance <i>R</i> is allowed to be positive, zero, or negative.
 In this model the temperature dependance is removed to simpyfy the resulting equation system.</p>
 </html>"),
   Icon(coordinateSystem(initialScale = 0.1), graphics={Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-70, 30}, {70, -30}}), Line(points = {{-90, 0}, {-70, 0}}, color = {0, 0, 255}), Line(points = {{70, 0}, {90, 0}}, color = {0, 0, 255}), Text(lineColor = {0, 0, 255}, extent = {{-120, 70}, {120, 30}}, textString = "%name")}),
   Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics={
   Rectangle(extent=  {{-70, 30}, {70, -30}}, lineColor = {0, 0, 255}),
   Line(points = {{-96, 0}, {-70, 0}}, color = {0, 0, 255}),
   Line(points = {{70, 0}, {96, 0}}, color = {0, 0, 255})}));

end TafelSlope;
