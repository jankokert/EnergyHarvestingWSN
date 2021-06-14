within EnergyHarvestingWSN.Interfaces;

partial model PartialBattery "A prototype of a battery"
  extends EnergyHarvestingWSN.Icons.Battery;
  extends EnergyHarvestingWSN.Interfaces.TwoPin;
  import SI = Modelica.Units.SI;

  parameter EnergyHarvestingWSN.Records.Batteries.template cellParam annotation(
    choicesAllMatching = true, Placement(visible = true, transformation(origin = {-80, 84}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  parameter Real SOCini = 1 "Initial state of charge" annotation(
    Dialog(group = "Initialization"));
  
  Real SOC;
  SI.ElectricCharge Q;

initial equation
  Q = SOCini * cellParam.C0;

equation
  
  annotation(
    defaultComponentName = "battery",
    Diagram(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1)),
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Line(points = {{-54, -100}, {54, -100}, {48, -100}})}));
end PartialBattery;
