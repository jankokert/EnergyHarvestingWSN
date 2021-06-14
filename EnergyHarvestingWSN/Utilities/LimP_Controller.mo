within EnergyHarvestingWSN.Utilities;
model LimP_Controller
  extends Modelica.Blocks.Interfaces.SISO;
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.LimP;
  extends EnergyHarvestingWSN.Icons.TopLabel;

  //parameter Real yMax(start = 1) "Upper limit of output";
  parameter Real yMin(start = -1) "Lower limit of output";
  parameter Real k(unit="1") = 1 "Gain";

  Modelica.Blocks.Interfaces.RealInput yMax(start = 1) "Upper limit of output" annotation(
    Placement(transformation(extent={{-140,-70},{-100,-30}}, rotation=0)));
    
  Modelica.Blocks.Interfaces.RealInput fb annotation(
    Placement(visible = true, transformation(origin = {-40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {-40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.BooleanOutput isLimited annotation(
    Placement(visible = true, transformation(extent = {{100, -70}, {120, -50}}, rotation = 0), iconTransformation(extent = {{100, -70}, {120, -50}}, rotation = 0)));
  
  Real err "internal error";
  Real yi "non-limited value";

equation
  err = u-fb;
  yi = k * err;
  y = smooth(0, if yi > yMax then yMax else if yi < yMin then yMin else yi);
  isLimited = (yi > yMax) or (yi < yMin);
  
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end LimP_Controller;
