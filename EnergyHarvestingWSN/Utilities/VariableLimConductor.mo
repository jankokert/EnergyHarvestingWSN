within EnergyHarvestingWSN.Utilities;
model VariableLimConductor
  "Ideal linear electrical conductor with variable conductance and min/max current limit"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  
  parameter Real iMin(start = 0) "Lower current limit";
  parameter Real iMax(start = 1) "Upper current limit";

  Modelica.Blocks.Interfaces.RealInput G annotation(
    Placement(transformation(origin = {0,110}, extent = {{-20,-20}, {20,20}}, rotation = 270)));

equation
  i = max(iMin, min(iMax, G*v));

  annotation (
    Documentation(info="<html>
<p>The linear conductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by
<br><i><b>i = G*v</b></i>
<br>The Conductance <i>G</i> is given as input signal.
<br><br><b>Attention!!!</b>
<br>It is recommended that the G signal should not cross the zero value. Otherwise depending on the surrounding circuit the probability of singularities is high.</p>
</html>",
   revisions="<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of conductance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>June 7, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),
    Icon(coordinateSystem(
  preserveAspectRatio=true,
  extent={{-100,-100},{100,100}},
  grid={2,2}), graphics={
    Line(points={{-90,0},{-70,0}}, color={0,0,255}),
    Rectangle(
      extent={{-70,30},{70,-30}},
      lineColor={0,0,255},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid),
    Line(points={{70,0},{90,0}}, color={0,0,255}),
    Line(points={{0,90},{0,30}}, color={0,0,255}),
    Text(
      extent={{-148,-41},{152,-81}},
      textString="%name",
      lineColor={0,0,255})}),
    Diagram(coordinateSystem(
  preserveAspectRatio=true,
  extent={{-100,-100},{100,100}},
  grid={2,2}), graphics={
    Line(points={{0,90},{0,30}}, color={0,0,255}),
    Line(points={{-96,0},{-70,0}}, color={0,0,255}),
    Line(points={{70,0},{96,0}}, color={0,0,255}),
    Rectangle(
      extent={{-70,30},{70,-30}},
      lineColor={0,0,255},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid)}));
end VariableLimConductor;
