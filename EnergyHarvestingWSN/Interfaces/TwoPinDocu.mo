within EnergyHarvestingWSN.Interfaces;

partial model TwoPinDocu "Component only for documentation to explain currents and voltages"
  extends EnergyHarvestingWSN.Interfaces.TwoPin;
  annotation(
    Documentation(info = "<html>
<p>Superclass of elements which have <b>two</b> electrical pins: the positive pin connector <i>p</i>, and the negative pin connector <i>n</i>. It is assumed that the current flowing into pin p is identical to the current flowing out of pin n. This current is provided explicitly as current i.</p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {5, 0}, textColor = {0, 136, 0}, extent = {{0, -4}, {60, 4}}, textString = "Vout", fontSize = 24, horizontalAlignment = TextAlignment.Left), Line(points = {{0, -50}, {0, 50}}, color = {0, 136, 0}, thickness = 0.5, arrow = {Arrow.None, Arrow.Open}, arrowSize = 6), Line(origin = {0, -100}, points = {{0, 0}, {0, 37}}, color = {0, 0, 127}, thickness = 0.5), Line(origin = {0, 100}, points = {{0, -37}, {0, 0}}, color = {0, 0, 127}, thickness = 0.5), Ellipse(origin = {0, -60}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, lineThickness = 0.5, extent = {{3, 3}, {-3, -3}}), Ellipse(origin = {0, 60}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, lineThickness = 0.5, extent = {{3, 3}, {-3, -3}}), Rectangle(lineColor = {95, 95, 95}, lineThickness = 0.5, extent = {{-100, 100}, {100, -100}})}));
end TwoPinDocu;
