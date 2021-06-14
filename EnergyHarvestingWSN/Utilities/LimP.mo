within EnergyHarvestingWSN.Utilities;
model LimP
  extends Modelica.Blocks.Interfaces.SISO;
  extends EnergyHarvestingWSN.Icons.Block;

  parameter Real k(unit = "1") = 1 "Gain";
  parameter Real yMin(start = -1) "Lower limit of output";
  parameter Real yMax(start = 1) "Upper limit of output";
  
  Modelica.Blocks.Interfaces.BooleanOutput isLimited annotation(
    Placement(transformation(extent={{100,-60},{120,-40}})));
  
  Real yi "non-limited output";

equation 
  yi = k*u;
  y = smooth(2, if yi > yMax then yMax else if yi < yMin then yMin else yi);

  isLimited = (yi > yMax) or (yi < yMin);
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end LimP;
