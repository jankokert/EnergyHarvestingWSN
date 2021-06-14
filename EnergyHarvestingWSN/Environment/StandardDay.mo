within EnergyHarvestingWSN.Environment;
model StandardDay
  extends Icons.Block;
  import SI = Modelica.Units.SI;
  import Modelica.Units.Conversions.*;
  
  parameter SI.Irradiance irrMax = 1000 "Max. Irradiance in W/qm";
  parameter Real cloudiness = 0.65 "Max. cloudiness (fraction)";
  parameter Real cloudChange = 30 "Cloud changes per day";
  parameter Real shading = 0.0 "Constant reduction due to clouds (experimental)";
  parameter SI.Time cloudStart(displayUnit="h") = from_hour(12) "Cloud start time";
  parameter SI.Time cloudStop(displayUnit="h") = from_hour(18) "Cloud stop time";
  parameter SI.Time timeOffset(displayUnit="h") = from_hour(0) "Time offset wrt. midnight";

  Real clouds;
  
  Modelica.Blocks.Interfaces.RealOutput irr(final quantity = "Irradiance", final unit = "W/m2") "Irradiance" annotation(
    Placement(visible = true, transformation(origin={120,0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0), iconTransformation(origin={120,0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));

protected  
  Real t, day2Pi;

equation
  t = time + timeOffset;
  day2Pi = 2*Modelica.Constants.pi/3600/24;
  irr = max(0, irrMax * (1-clouds) * max(0, -cos(t*day2Pi)));
  if cloudStart < mod(t, 3600*24) and mod(t, 3600*24) < cloudStop then
    clouds = shading + cloudiness*sin((t-cloudStart) * day2Pi * cloudChange/2)^2 * (1-shading);
  else
    clouds = 0;
  end if;
  
  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false, initialScale = 0.1), graphics = {Line(origin = {-75, -50}, points = {{-20, 0}, {20, 0}}), Line(origin = {0, 10}, points = {{-55, -60}, {-42, -5}, {-25, 37}, {0, 60}, {6, 50}, {10, -60}, {15, 90}, {20, -75}, {25, 65}, {30, -70}, {35, 30}, {40, -70}, {45, 0}, {50, -60}, {55, -60}}, smooth = Smooth.Bezier), Line(origin = {75, -50}, points = {{-20, 0}, {20, 0}})}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end StandardDay;
