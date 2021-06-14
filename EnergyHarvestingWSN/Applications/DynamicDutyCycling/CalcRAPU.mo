within EnergyHarvestingWSN.Applications.DynamicDutyCycling;
model CalcRAPU
  import SI = Modelica.SIunits;
  extends EnergyHarvestingWSN.Icons.Block;  
  outer parameter SI.Time RAPUPeriod;

  outer Real batteryFactor;  // To multiply with the harvest (depends on battery status)
  outer Real soc;

  parameter Real alpha = 0.8;

  parameter Integer savedSize = 72;
  Integer elementsToAverage;
  Real averagedPredictions;

  Modelica.Blocks.Interfaces.RealInput prediction(unit = "W") annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput RAPU(unit = "W") annotation(
  Placement(visible = true, transformation(extent = {{100, -10}, {120, 10}}, rotation = 0), iconTransformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));

protected
  Real savedPredictions[savedSize];

initial algorithm
  RAPU := 0;
  elementsToAverage := 0;
  savedPredictions := zeros(savedSize);
  averagedPredictions := 0.0;

algorithm
  // Calculate the Recommended Average Power Usage once every RAPUPeriod
  when sample(0, RAPUPeriod) then
    // Fake for modelica
    for j in 1:savedSize loop
      savedPredictions[j] := savedPredictions[j];
    end for;

    // -------------------------------------------
    //            Average predictions
    // -------------------------------------------

    // Counting the actual elements
    if elementsToAverage < savedSize then 
      elementsToAverage := elementsToAverage + 1;
    end if;

    // Fifo for savedPredictions
    for j in savedSize-1:-1:1 loop
      savedPredictions[j+1] := savedPredictions[j];
    end for;
    savedPredictions[1] := prediction;

    // Calculate average
    averagedPredictions := sum(savedPredictions) / elementsToAverage;

    // -------------------------------------------
    //    RAPU: Recommended Average Power Usage
    // -------------------------------------------

    // Recommended Average Power Usage
    // Full bat: Rely on averagedPredictions
    // Empty bat: Rely on prediction!
//    RAPU := (alpha) * averagedPredictions * (soc) + (1-alpha) * batteryFactor * prediction * (1-soc);
//    RAPU := (soc) * averagedPredictions + (1-soc) * batteryFactor * prediction;
//    RAPU := batteryFactor * prediction;
    RAPU := prediction;

    // RAPU smaller than zero makes no sense.
    if RAPU < 0 then
      RAPU := 0;
    end if;
  end when;

annotation(
  Icon(graphics = {Text(origin = {0, -1}, extent = {{-150, 53}, {150, -53}}, textString = "Calc\nRAPU")}));
    
end CalcRAPU;
