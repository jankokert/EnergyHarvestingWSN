within EnergyHarvestingWSN.Interfaces;
partial model TwoPin
  "Component with two electrical pins p and n and current i from p to n"
  import SI = Modelica.Units.SI;
  
  inner SI.Voltage Vout "Voltage drop between the two terminal pins";
  
  Modelica.Electrical.Analog.Interfaces.PositivePin p "Positive pin (potential p.v > n.v for positive voltage drop v)" annotation(
    Placement(transformation(extent = {{-10,90},{10,110}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n "Negative pin" annotation(
    Placement(transformation(extent = {{10,-110},{-10,-90}}, rotation = 0)));

equation
  Vout = p.v - n.v;
    
  annotation (
    Documentation(info="<html>
<p>Superclass of elements which have <b>two</b> electrical pins: the positive pin connector <i>p</i>, and the negative pin connector <i>n</i>. It is assumed that the current flowing into pin p is identical to the current flowing out of pin n. This current is provided explicitly as current i.</p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})));
end TwoPin;
