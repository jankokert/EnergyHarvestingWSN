within EnergyHarvestingWSN.Environment.UnitTests;
model IscTest
  extends Modelica.Icons.ExamplesPackage;
  
  EnergyHarvestingWSN.Environment.Isc isc(colIsc = 2, fileName = "/Resources/ISC.csv")  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  annotation(
    experiment(StartTime = 0, StopTime = 864000, Tolerance = 1e-06, Interval = 10));
end IscTest;
