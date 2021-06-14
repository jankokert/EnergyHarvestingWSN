within EnergyHarvestingWSN.Utilities;

model PI_Controller
  extends Modelica.Blocks.Interfaces.SISO;
  extends EnergyHarvestingWSN.Icons.BottomLabel;
  extends EnergyHarvestingWSN.Icons.Block;
  import SI = Modelica.Units.SI;

  parameter Real k(unit = "1") = 1 "Gain";
  parameter SI.Time T(min = Modelica.Constants.small) = 1 "Time constant (T>0 is required)";
 
  Real x "State of block";
  
initial equation
  x = 0;

equation
  der(x) = u/T;
  y = k * (x + u);
  
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-70, -60}, {-70, -10}, {70, 60}}, color = {170, 0, 0}), Text(origin = {20, -40}, extent = {{-50, 25}, {50, -25}}, textString = "PI")}),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end PI_Controller;
