within EnergyHarvestingWSN.Environment.UnitTests;
model ExpResultsTest
  extends Modelica.Icons.ExamplesPackage;
  
  EnergyHarvestingWSN.Environment.ExpResults expResults(fileName = "/Resources/MEHM4-20mA_bq25570_2x25_LDO.txt") annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
end ExpResultsTest;
