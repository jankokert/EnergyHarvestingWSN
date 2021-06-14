within EnergyHarvestingWSN.Applications.DynamicDutyCycling;

function getHarvestAverage
  input Integer elementsToAverage;
  output Real harvestAverage;

protected
  outer parameter Integer harvestedHistorySize;
  outer Integer harvestedHistoryEntries;
  outer Real harvestedHistory[harvestedHistorySize];
  Real elements;
  Real average;

algorithm
  average := 0;
  elements := elementsToAverage;

  // Make sure we stay in bounds
  if elementsToAverage > 10 then
    elements := 10;
  end if;

  // Calculate the average
  for i in 1:elements loop
    average := average + harvestedHistory[i];
  end for;
  harvestAverage := average/elements;

end getHarvestAverage;
