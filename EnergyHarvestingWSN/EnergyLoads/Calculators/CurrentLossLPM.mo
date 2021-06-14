within EnergyHarvestingWSN.EnergyLoads.Calculators;


block CurrentLossLPM
  extends EnergyHarvestingWSN.Icons.Block;
  parameter Real c1 = 0 "LPM Fit parameter 1 (current in uA)";
  Modelica.Blocks.Interfaces.RealOutput i annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
equation
  i = c1 * 1e-006;
  // uA -> A
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics={  Text(extent = {{-46, 28}, {52, -30}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "LPM")}));
end CurrentLossLPM;
