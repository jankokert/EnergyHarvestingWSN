within EnergyHarvestingWSN.EnergyStorages.Components;
model CurrentIntegrator
  extends EnergyHarvestingWSN.Icons.RoundSensor;
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  import SI = Modelica.Units.SI;
  
  Modelica.Blocks.Interfaces.RealInput SoC(unit="%") annotation(
      Placement(visible = true, transformation(origin = {-100, 110}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {-120, -80},extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Q(unit="C") annotation(
    Placement(visible = true, transformation(origin = {0, 100},extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {0, -110},extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  
  //outer Real SOC;
  outer SI.Current Icell;
  
equation
  der(Q) = if SoC < 0.001 and Icell < 0 or SoC > 1 and Icell > 0 then 0 else Icell;

    
annotation(
    Icon(graphics = {Line( points = {{0, -100}, {0, -70}}, color = {0, 0, 127}), Line(points = {{-96, 0}, {-70, 0}}, color = {0, 0, 255}), Line(points = {{70, 0}, {96, 0}}, color = {0, 0, 255}), Line(points = {{45, 26}, {80, 45}}, color = {170, 0, 0}, thickness = 1), Text(origin = {-84, -65}, rotation = -90, lineColor = {170, 0, 0}, lineThickness = 1, extent = {{-49, 14}, {49, -14}}, textString = "limits"), Line(points = {{-45, 26}, {-80, 45}}, color = {170, 0, 0}, thickness = 1)}));
end CurrentIntegrator;
