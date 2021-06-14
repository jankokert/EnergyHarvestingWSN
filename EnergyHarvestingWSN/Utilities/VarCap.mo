within EnergyHarvestingWSN.Utilities;
model VarCap "variable capacitor"
  extends EnergyHarvestingWSN.Interfaces.Sink(v(start=0));
  import SI = Modelica.Units.SI;
  
  parameter SI.Capacitance C0(start=1) "Capacitance";
  parameter Real Cv(quantity="Voltage dependance", unit="F/V", start=1) "Voltage dependance";
  SI.Capacitance C;

equation
  C = C0 + Cv*v;
  iin = C * der(v);
  
  annotation (
    Documentation(info="<html>
<p>The linear capacitor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i = C * dv/dt</i>. The Capacitance <i>C</i> is allowed to be positive or zero.</p>

</html>",
 revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
    Icon(coordinateSystem(initialScale = 0.1, grid = {1, 1}), graphics={
    Line(origin = {0, 8}, rotation = 90, points = {{0, 28}, {0, -28}}, color = {0, 0, 255}),
    Line(origin = {0, -10}, rotation = 90, points = {{0, 28}, {0, -28}}, color = {0, 0, 255}),
    Line(origin = {0, 50}, rotation = 90, points = {{-42, 0}, {42, 0}}, color = {0, 0, 255}),
    Line(origin = {0, -52}, rotation = 90, points = {{-42, 0}, {42, 0}}, color = {0, 0, 255}),
    Text(origin = {-60, 0}, rotation = 270, extent = {{-160, 16}, {160, -16}}, textString = "C0=%C0"),
    Text(origin = {64, -1}, rotation = 270, lineColor = {0, 0, 255}, extent = {{-150, 20}, {150, -20}}, textString = "%name"),
    Text(origin = {-90, 0}, rotation = 270, extent = {{-160, 16}, {160, -16}}, textString = "Cv=%Cv")}),
    Diagram(coordinateSystem(initialScale = 0.1), graphics={
    Line( points = {{40, 20}, {-40, 20}}, color = {0, 0, 255}, thickness = 0.5),
    Line(points = {{40, -20}, {-40, -20}}, color = {0, 0, 255}, thickness = 0.5),
    Line(points = {{0, 100}, {0, 20}}, color = {0, 0, 255}),
    Line(points = {{0, -20}, {0, -100}}, color = {0, 0, 255})}));
end VarCap;
