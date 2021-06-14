within EnergyHarvestingWSN.Applications.DynamicDutyCycling;

function getHour
  input Real myTime;
  input Real offset;
  output Integer y;

algorithm
  y := integer(mod(floor(myTime / 3600.0) + offset, 24.0)) + 1;

end getHour;
