within EnergyHarvestingWSN.Utilities;
model IdealSPST "An ideal Single Pole Single Throw toggle switch"

  parameter Modelica.Units.SI.Resistance Roff(final min = 0) = 1.E+9 "Open resistance to avoid singularities";
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(
    Placement(transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
    Placement(transformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput control "true => connected, false => open" annotation(
    Placement(transformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 270)));
    
equation
  0 = p.i + n.i;
  if control then
    // p and n are connected
    p.v - n.v = 0;
  else
    // p and n are not connected (open)
    //p.i = 0;
    //n.i = 0;
    p.v - n.v = n.i*Roff;
  end if;
  annotation(
    Documentation(info = "<HTML>
 <P>
 The commuting switch has a positive pin p and two negative pins n1 and n2.
 The switching behaviour is controlled
 by the inpug signal control. If control is true, the pin p is connected
 with the negative pin n2. Otherwise, the pin p is connected to the negative pin n1.
 </P>
 <P>
 In order to prevent singularities during switching, the opened
 switch has a (very low) conductance Goff
 and the closed switch has a (very low) resistance Ron.
 The limiting case is also allowed, i.e., the resistance Ron of the
 closed switch could be exactly zero and the conductance Goff of the
 open switch could be also exactly zero. Note, there are circuits,
 where a description with zero Ron or zero Goff is not possible.
 <br> <br>
 <b>Please note:</b>
 In case of useHeatPort=true the temperature dependence of the electrical
 behavior is <b> not </b> modelled. The parameters are not temperature dependent.
 </P>
 </HTML>
 ", revisions = "<html>
 <ul>
 <li><i> March 11, 2009   </i>
        by Christoph Clauss<br> conditional heat port added<br>
        </li>
 <li><i> 1998   </i>
        by Christoph Clauss<br> initially implemented<br>
        </li>
 </ul>
 </html>"),
    Icon(coordinateSystem(grid = {1, 1}, initialScale = 0.1), graphics = {
    Ellipse(extent = {{-44, 4}, {-36, -4}}, lineColor = {0, 0, 255}),
    Line(points = {{-90, 0}, {-44, 0}}, color = {0, 0, 255}),
    Line(points = {{-37, 2}, {40, 50}}, color = {0, 0, 255}),
    Line(points = {{0, 90}, {0, 25}}, color = {0, 0, 255}),
    Line(points = {{40, 0}, {90, 0}}, color = {0, 0, 255}),
    Line(points = {{0, -100}, {0, 25}}, color = {127, 0, 0}, smooth = Smooth.None, pattern = LinePattern.Dot),
    Text(extent = {{-148, -22}, {152, -62}}, textString = "%name", lineColor = {0, 0, 255})}),
    Diagram(coordinateSystem(preserveAspectRatio = false, grid = {1, 1}, initialScale = 0.1), graphics = {
    Ellipse(extent = {{-44, 4}, {-36, -4}}, lineColor = {0, 0, 255}),
    Line(points = {{-96, 0}, {-44, 0}}, color = {0, 0, 255}),
    Line(points = {{-37, 2}, {40, 50}}, color = {0, 0, 255}),
    Line(points = {{0, 60}, {0, 25}}, color = {0, 0, 255}),
    Line(points = {{40, 0}, {96, 0}}, color = {0, 0, 255})}));
end IdealSPST;
