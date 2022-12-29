within EnergyHarvestingWSN.EnergyStorages.Components;

model Integrator
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends EnergyHarvestingWSN.Icons.RoundSensor;
  extends EnergyHarvestingWSN.Icons.TopLabel;
  import SI = Modelica.Units.SI;
  Modelica.Blocks.Interfaces.RealInput SoC annotation(
    Placement(visible = true, transformation(origin = {-100, 110}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Q(unit = "C") annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Real SOCini "Initial state of charge" annotation(
    Dialog(group = "Initialization"));
  outer SI.Current Icell;
  outer Real C;
  
initial equation
  Q = SOCini * C;
  
equation
  der(Q) = if Q <= 1e-6 and Icell < 0 or 1 <= SoC and 0 < Icell then 0 else Icell;
  v = 0;  // ideal sensor, no voltage drop
  
  annotation(
    Icon(graphics = {Line(points = {{0, -100}, {0, -70}}, color = {0, 0, 127}), Line(points = {{-96, 0}, {-70, 0}}, color = {0, 0, 255}), Line(points = {{70, 0}, {96, 0}}, color = {0, 0, 255}), Line(points = {{45, 26}, {80, 45}}, color = {170, 0, 0}, thickness = 1), Text(origin = {-84, -65}, rotation = -90, textColor = {170, 0, 0}, extent = {{-49, 14}, {49, -14}}, textString = "limits"), Line(points = {{-45, 26}, {-80, 45}}, color = {170, 0, 0}, thickness = 1), Text(extent = {{-29, -70}, {30, -11}}, textString = "Q", fontName = "Arial")}));
end Integrator;
