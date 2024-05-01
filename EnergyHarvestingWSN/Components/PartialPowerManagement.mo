within EnergyHarvestingWSN.Components;
partial model PartialPowerManagement
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.Energy;
  extends EnergyHarvestingWSN.Interfaces.ThreePin;
  
  EnergyHarvestingWSN.Interfaces.EnergyInfo energyInfo annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

initial equation
  energyInfo.EstoreDiff = 0;
  energyInfo.Econs = 0;
  energyInfo.Eharv = 0;
  
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Text(origin = {47, -64}, extent = {{-45, 30}, {41, -26}}, textString = "µPM")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
end PartialPowerManagement;
