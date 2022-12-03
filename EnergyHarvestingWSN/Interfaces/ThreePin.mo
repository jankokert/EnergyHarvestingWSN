within EnergyHarvestingWSN.Interfaces;
partial model ThreePin
  "Component with three electrical pins pin, pout and n"
  import SI = Modelica.Units.SI;

  // the "inner" prefix provides the following variables for blocks within this model
  inner SI.Voltage Vin(start=0);
  inner SI.Voltage Vout(start=0);
  inner SI.Current Iin, Iout;
  
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pout annotation(
    Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));

equation
  Vin = pin.v - n.v;
  Iin = pin.i;
  Vout = pout.v - n.v;
  Iout = -pout.i;
  
  annotation (
    Documentation(info="<html>
<p>Superclass of elements which have <b>two</b> electrical pins: the positive pin connector <i>p</i>, and the negative pin connector <i>n</i>. It is assumed that the current flowing into pin p is identical to the current flowing out of pin n. This current is provided explicitly as current i.</p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {-83, 69}, textColor = {0, 136, 0}, extent = {{-10, -4}, {10, 4}}, textString = "Iin", fontSize = 12), Text(origin = {75, 69}, textColor = {0, 136, 0}, extent = {{-10, -4}, {10, 4}}, textString = "Iout", fontSize = 12), Line(origin = {-88.4727, 47.1386}, points = {{-2, 17}, {16, 17}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Line(origin = {69.2961, 47.1386}, points = {{-2, 17}, {16, 17}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Line(origin = {60, 0}, points = {{0, 50}, {0, -70}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Text(origin = {58, 0}, textColor = {0, 136, 0}, extent = {{-30, -4}, {0, 4}}, textString = "Vout", fontSize = 12, horizontalAlignment = TextAlignment.Right), Text(origin = {-58, 0}, textColor = {0, 136, 0}, extent = {{0, -4}, {30, 4}}, textString = "Vin", fontSize = 12, horizontalAlignment = TextAlignment.Left), Line(origin = {-60, 0}, points = {{0, 50}, {0, -70}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Line(origin = {0, -90}, points = {{0, -10}, {0, 10}}, color = {0, 0, 127}), Line(origin = {0, -90}, points = {{-60, 10}, {60, 10}}, color = {0, 0, 127}), Line(origin = {0, 60}, points = {{-100, 0}, {-60, 0}}, color = {0, 0, 127}), Line(origin = {0, 60}, points = {{100, 0}, {60, 0}}, color = {0, 0, 127})}));
end ThreePin;
