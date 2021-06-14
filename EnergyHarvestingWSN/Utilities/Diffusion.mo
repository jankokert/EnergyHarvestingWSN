within EnergyHarvestingWSN.Utilities;

model Diffusion "A load with represents diffusion losses"  
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  
  parameter Modelica.SIunits.Current i0 = 7E-8 "exchange current at v0";  
  parameter Modelica.SIunits.Voltage v0 = 2.71 "tafel slope (voltage per decade)";
    
equation
  //i = i0 * exp(-(v^2)/b);
  //i = i0 * log(sqrt(v));
  //i = i0 * (exp(v/vt)-1);
  
  // gut
  //i = i0 * (exp((v/vt)^1.5)-1);
  
  //i = i0 * (exp(v/vt)-1)^0.5;
  //i = i0 * exp( -(v/vt)^2 );
  //i * v = i0;
  //v / i = time;
  
  //i = i0/sqrt(time);
  //i = i0*sqrt(v)/(v0-v);
  i = (i0*v0) /(v0-v);

  //der(v) = sqrt(i);
  
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

end Diffusion;
