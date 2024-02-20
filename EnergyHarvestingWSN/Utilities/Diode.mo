within EnergyHarvestingWSN.Utilities;
model Diode "Simple diode with exponential behavior and with non-ideality factor"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  import SI = Modelica.Units.SI;
  import Modelica.Constants.k "Boltzmann's constant, [J/K]";
  import Modelica.Constants.q "Electron charge, [As]";
  
  parameter SI.Current Ids = 1.e-6 "Saturation current";
  parameter Real nideal = 1 "Non-ideality factor";
  parameter SI.Temperature T = 298;
  
  SI.Voltage Vt "Temperature voltage";

equation
  Vt = k*T/q;
  i = Ids * (exp(v / (Vt * nideal)) - 1);
  
  annotation(
    Documentation(info = "<html>
<p>The is a real diode with exponential dependency. The diode formula is:</p>
<pre>                v/vt
   i  =  ids ( e      - 1).</pre>
<p>If bla...</p>
</html>"),
    Icon(coordinateSystem(grid = {1, 1}, initialScale = 0.1), graphics = {
    Polygon(fillColor = {255, 0, 0}, points = {{30, 0}, {-30, 40}, {-30, -40}, {30, 0}}),
    Line(points = {{-96, 0}, {40, 0}}, color = {0, 0, 255}),
    Line(points = {{40, 0}, {96, 0}}, color = {0, 0, 255}),
    Line(points = {{30, 40}, {30, -40}}, color = {0, 0, 255}),
    Text(textColor = {0, 0, 255}, extent = {{-156, 90}, {144, 50}}, textString = "%name")}));
end Diode;
