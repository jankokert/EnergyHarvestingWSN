within EnergyHarvestingWSN.Interfaces;
partial model ConditionalMPPpin
  "Partial model to include an optional mpp input"
  import SI = Modelica.Units.SI;
  
  parameter Boolean useExternalMPP = false annotation(
    Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter SI.Voltage fixedMPP = 1 "Fixed V_mpp if useExternalMPP = false" annotation(
    Dialog(enable=not useExternalMPP));
  Modelica.Blocks.Interfaces.RealInput extMPP if useExternalMPP annotation(
    Placement(visible = true, transformation(origin = {-105, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
   
  inner SI.Voltage Vmpp;

equation
  if useExternalMPP then
    Vmpp = extMPP;
  else
    Vmpp = fixedMPP;
  end if;
  
end ConditionalMPPpin;
