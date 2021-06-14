within EnergyHarvestingWSN.Applications.DynamicDutyCycling;
model DirectCommunication
  import SI = Modelica.SIunits;
  extends EnergyHarvestingWSN.Icons.Block;

  // Regular input
  Modelica.Blocks.Interfaces.IntegerInput idealPeriods[loadInfo.ntasks] annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  // BUS
  outer EnergyHarvestingWSN.Interfaces.LoadInfo loadInfo;

initial equation
  for i in 1:loadInfo.ntasks loop
    idealPeriods[i] = 1;  
  end for;
  
equation
  for i in 1:loadInfo.ntasks loop
    loadInfo.periods[i] = integer(idealPeriods[i]);
  end for;

annotation(
  Icon(graphics = {Text(origin = {-10, -1}, extent = {{-140, 51}, {160, -51}}, textString = "Direct\nComm.")}));
  
end DirectCommunication;
