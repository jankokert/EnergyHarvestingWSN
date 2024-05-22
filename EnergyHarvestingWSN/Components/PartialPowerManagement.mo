within EnergyHarvestingWSN.Components;
partial model PartialPowerManagement
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.Energy;
  extends EnergyHarvestingWSN.Interfaces.ThreePin;
  

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Text(origin = {47, -64}, extent = {{-45, 30}, {41, -26}}, textString = "µPM")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
end PartialPowerManagement;
