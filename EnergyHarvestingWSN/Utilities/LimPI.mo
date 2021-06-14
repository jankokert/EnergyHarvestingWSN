within EnergyHarvestingWSN.Utilities;

model LimPI
  extends Modelica.Blocks.Interfaces.SISO;
  extends EnergyHarvestingWSN.Icons.Block;
  import SI = Modelica.Units.SI;
  
  Modelica.Blocks.Interfaces.BooleanOutput isLimited annotation(
    Placement(transformation(extent = {{100,-60},{120,-40}})));
  parameter Real yMax(start = 1) "Upper limit of output";
  parameter Real yMin(start = 0) "Lower limit of output";
  parameter Real k(unit = "1") = 1 "Gain";
  parameter SI.Time T(min = Modelica.Constants.small) = 1 "Time constant (T>0 is required)";

  Real x "State of block";
  Real yi "non-limited output";

initial equation
  x = 0;

equation
  der(x) = u/T;
  yi = k * (u + x);
  y = if yi > yMax then yMax else if yi < yMin then yMin else yi;
  isLimited = (yi > yMax) or (yi < yMin);
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics = {Text(origin = {20, -40}, extent = {{-70, 22}, {70, -22}}, textString = "LimPI"), Line(points = {{-70, -60}, {-70, -20}, {40, 50}, {70, 50}}, color = {170, 0, 0})}),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end LimPI;
