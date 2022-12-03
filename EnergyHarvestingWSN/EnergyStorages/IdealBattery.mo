within EnergyHarvestingWSN.EnergyStorages;
model IdealBattery "Ideal battery with constant voltage and SoC"
  extends EnergyHarvestingWSN.Interfaces.TwoPin;
  extends EnergyHarvestingWSN.Interfaces.Source;  // added, as there is no ECD
  import SI = Modelica.Units.SI;

  Modelica.Blocks.Interfaces.RealOutput SOCout annotation(
    Placement(visible = true, transformation(origin = {108, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  SI.ElectricCharge Qabs;
 
initial equation
  Qabs = 0;
   
equation
  SOC = Q / cellParam.C0;
  SOCout = SOC;
  der(Q) = if Q > cellParam.C0 and -iout > 0 then 0 else -iout;  // "-iout": charge is taken from the battery
  der(Qabs) = abs(-iout);
  v = if Q < 0 then 0 else cellParam.E0;  // set voltage to zero when SoC is negative
  assert(Q > 0, "Battery deeply discharged!", AssertionLevel.warning);
  
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1)),
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Line(points = {{-54, -100}, {54, -100}, {48, -100}}), Line(origin = {77, 0}, points = {{23, 0}, {-23, 0}})}));
end IdealBattery;
