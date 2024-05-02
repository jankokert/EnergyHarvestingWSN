within EnergyHarvestingWSN.Applications.DynamicDutyCycling;

class Storage
  record Rec
    parameter Integer length = 72;  // three days
    Real power[length];
  end Rec;

  function getAverage
    input Rec history;
    input Integer elements;
    output Real avg;

  algorithm
    // avg := sum(data.power) / size(data.power,1);
    avg := 0;
    for i in 1:elements loop
      avg := avg + history.power[i];
    end for;
    avg := avg / elements;

  end getAverage;

  function appendValue  
    input Rec dataIn;
    input Real val;
    output Real[size(dataIn,1)] out;

  algorithm
    // FIFO adding new element at position [1]
    for i in (size(dataIn,1)-1):-1:1 loop
      out[i+1] := dataIn[i];
    end for;
    out[1] := val;
  end appendValue;

end Storage;
