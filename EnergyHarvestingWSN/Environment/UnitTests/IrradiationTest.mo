within EnergyHarvestingWSN.Environment.UnitTests;
model IrradiationTest
  extends Modelica.Icons.ExamplesPackage;
  
  EnergyHarvestingWSN.Environment.SolarIrradiation solarIrradiation(colIrr = 10, fileName = "/Resources/USA_CA_San.Francisco.Intl.AP.724940_TMY3.txt") annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
end IrradiationTest;
