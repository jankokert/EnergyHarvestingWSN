within EnergyHarvestingWSN.Components;
partial model PartialLoad
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.IC2;
  extends EnergyHarvestingWSN.Icons.LeftLabel;
  extends EnergyHarvestingWSN.Interfaces.TwoPin;
  import SI = Modelica.Units.SI;
  
  parameter EnergyHarvestingWSN.Records.LoadCases.template loadCase annotation(
    Placement(visible = true, transformation(origin = {-80, 84}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  parameter Boolean useExternalPeriods = false annotation(
    Evaluate = true, HideResult = true, choices(checkBox = true));
  //Modelica.Blocks.Interfaces.RealInput period[loadCase.ntasks] annotation(
  //  Placement(visible = true, transformation(extent = {{-120, -10}, {-100, 10}}, rotation = 0), iconTransformation(extent = {{-120, -10}, {-100, 10}}, rotation = 0)));
  //Modelica.Blocks.Interfaces.BooleanOutput taskIsOn[loadCase.ntasks] annotation(
  //  Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Interfaces.LoadInfo loadInfo annotation(
    Placement(visible = true, transformation(origin = {60, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {60, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Text(origin = {62, -78}, lineColor = {230, 230, 230}, extent = {{-10, 10}, {10, -10}}, textString = "%loadCase", fontSize = 1)}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end PartialLoad;
