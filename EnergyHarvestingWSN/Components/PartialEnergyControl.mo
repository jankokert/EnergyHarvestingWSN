within EnergyHarvestingWSN.Components;
partial model PartialEnergyControl
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.TopLabel;
  extends EnergyHarvestingWSN.Icons.Control;

  //parameter EnergyHarvestingWSN.Records.LoadCases.template loadCase annotation(
  //  Placement(visible = true, transformation(origin = {-80, 84}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));

  EnergyHarvestingWSN.Interfaces.EnergyInfo energyInfo annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  //Modelica.Blocks.Interfaces.RealOutput period[loadCase.ntasks] annotation(
  //  Placement(visible = true, transformation(extent = {{100, -70}, {120, -50}}, rotation = 0), iconTransformation(extent = {{100, -70}, {120, -50}}, rotation = 0)));
  //Modelica.Blocks.Interfaces.BooleanInput taskIsOn[loadCase.ntasks] annotation(
  //  Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));//
  inner EnergyHarvestingWSN.Interfaces.LoadInfo loadInfo annotation(
    Placement(visible = true, transformation(origin = {100, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {100, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1)));
end PartialEnergyControl;
