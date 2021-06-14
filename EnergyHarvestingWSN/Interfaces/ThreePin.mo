within EnergyHarvestingWSN.Interfaces;
partial model ThreePin
  "Component with three electrical pins pin, pout and n"

  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pout annotation(
    Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));

equation

  annotation (
    Documentation(info="<html>
<p>Superclass of elements which have <b>two</b> electrical pins: the positive pin connector <i>p</i>, and the negative pin connector <i>n</i>. It is assumed that the current flowing into pin p is identical to the current flowing out of pin n. This current is provided explicitly as current i.</p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}})));
end ThreePin;
