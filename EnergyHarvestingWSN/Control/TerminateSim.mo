within EnergyHarvestingWSN.Control;
block TerminateSim
  extends EnergyHarvestingWSN.Icons.Block;
  Modelica.Blocks.Interfaces.BooleanInput u annotation(
  Placement(transformation(extent = {{-120, -10}, {-100, 10}}), iconTransformation(extent = {{-120, -10}, {-100, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
  Placement(transformation(extent = {{100, -10}, {120, 10}})));

algorithm
  if u then
    terminate("Simulation terminated automatically");
    y := time;
  end if;
  
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={
    Text(extent = {{-88, 40}, {88, -40}}, textString = "terminate simulation", pattern = LinePattern.None)}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end TerminateSim;
