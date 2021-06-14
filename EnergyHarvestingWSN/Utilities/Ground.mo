within EnergyHarvestingWSN.Utilities;

model Ground "Ground node"

  Modelica.Electrical.Analog.Interfaces.Pin p annotation (Placement(transformation(
        origin={0,100},
        extent={{10,-10},{-10,10}},
        rotation=270)));
equation
  p.v = 0;
  annotation (
    Documentation(info="<html>
<p>Ground of an electrical circuit. The potential at the ground node is zero. Every electrical circuit has to contain at least one ground object.</p>
</html>", revisions="<html>
<ul>
<li><i> 1998   </i>
     by Christoph Clauss<br> initially implemented<br>
     </li>
</ul>
</html>"),
    Icon(coordinateSystem(initialScale = 0.1), graphics={
        Line(points={{-40, 60},{40, 60}}, color={0,0,255}),
        Line(points={{0,90},{0,60}}, color={0,0,255})}),
    Diagram(coordinateSystem(initialScale = 0.1), graphics={Line(points = {{-60, 60}, {60, 60}}, color = {0, 0, 255}, thickness = 0.5), Line(points = {{0, 96}, {0, 60}}, color = {0, 0, 255}, thickness = 0.5), Text(lineColor = {0, 0, 255}, extent = {{-24, -38}, {22, -6}}, textString = "p.v=0")}));
end Ground;
