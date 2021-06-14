within EnergyHarvestingWSN.Control;
model DutyCycleStep
  extends EnergyHarvestingWSN.Icons.Block;
  parameter Modelica.SIunits.Time activeTime = 0.1;
  parameter Modelica.SIunits.Time periode = 60;
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}})));

algorithm
  when sample(0.0, periode) then
    y := 1;
  end when;
  when {sample(activeTime, periode), initial()} then
    y := 0;
  end when;
  
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={
    Line(points = {{-78, -50}, {-58, -50}, {-58, 30}, {-38, 30}, {-38, -50}, {20, -50}, {20, 30}, {40, 30}, {40, -50}, {78, -50}}, color = {0, 0, 0}, smooth = Smooth.None),
    Text(extent = {{-80, 80}, {80, 40}}, textString = "duty cycle", pattern = LinePattern.None)}));
end DutyCycleStep;
