within EnergyHarvestingWSN.Applications.DynamicDutyCycling;
model PredictWCMA
  import SI = Modelica.Units.SI;
  extends EnergyHarvestingWSN.Icons.Block;  
  outer parameter SI.Time RAPUPeriod;
  
  SI.Power avgPower "Averaged power of the current interval (energy/1s)";

  Integer currentHour;
  Integer nextHour;

  // WCMA
  parameter Integer timeSteps = 48;
  parameter Real alpha = 0.7;
  parameter Integer pastDays = 4;
  Real WCMA_FUTURE_PAST_MEAN;
  Real WCMA_GAP;

  Modelica.Blocks.Interfaces.RealInput averagePower(unit = "W") annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput prediction(unit = "W") annotation(
  Placement(visible = true, transformation(extent = {{100, -10}, {120, 10}}, rotation = 0), iconTransformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));

protected
  Real WCMA_MEAN[timeSteps] (each start = 0.0, each fixed = true);
  Real WCMA_V[timeSteps] (each start = 0.0, each fixed = true);
  Real WCMA_P[timeSteps] (each start = 0.0, each fixed = true);
  SI.Energy WCMA_averageHarvest[pastDays, timeSteps] (each start = 0.0, each fixed = true);

initial algorithm
  prediction := 0;
  avgPower := 0;
  WCMA_FUTURE_PAST_MEAN := 0;
  WCMA_GAP := 0;

algorithm
  // Pseudo init to make openModelica happy! =)
  // Each field needs at least one equation.
  when time >= 1.0 then
    for i in 1:pastDays loop
      for j in 1:timeSteps loop
        WCMA_averageHarvest[i, j] := 0.0;
      end for;
    end for;

    for i in 1:timeSteps loop
      WCMA_MEAN[i] := 0;
      WCMA_V[i] := 0;
      WCMA_P[i] := 0;
    end for;
  end when;

  // Calculate the Proposed Average Energy Consumption once every RAPUPeriod
  when sample(0, RAPUPeriod) then
    // Calculate the average power (energy / 1s)
    avgPower := averagePower;

    // -------------------------------------------
    //  WCMA: Weather Conditioned Moving Average
    // -------------------------------------------
    // Notice: currentHour "travels" through the array
    //         while days are shifted at the end of the day
    // First, we save the harvest of the current hour
    WCMA_averageHarvest[1, currentHour] := avgPower;

    // Calculate the WCMA_MEAN for the past D days
    WCMA_MEAN := zeros(timeSteps);
    for steps in 1:timeSteps loop
      for days in 1:pastDays loop
        WCMA_MEAN[steps] := WCMA_MEAN[steps] + WCMA_averageHarvest[days,steps];
      end for;
      WCMA_MEAN[steps] := WCMA_MEAN[steps]/timeSteps;
    end for;

    // Calculate the mean based on the next timeslot (n+1)
    // with respect to the past D days
    WCMA_FUTURE_PAST_MEAN := 0;
    for days in 1:pastDays loop
      WCMA_FUTURE_PAST_MEAN := WCMA_FUTURE_PAST_MEAN + WCMA_averageHarvest[days,nextHour];
    end for;
    WCMA_FUTURE_PAST_MEAN := WCMA_FUTURE_PAST_MEAN/timeSteps;

    // Calculate the WCMA_V and WCMA_P Vectors for the numerator
    for i in 1:timeSteps loop
      // Calculate the WCMA_V quotient Vector
      // Prevent division by zero!
      if WCMA_MEAN[i] <= 0 then
        WCMA_V[i] := WCMA_averageHarvest[1, i];
      else
        WCMA_V[i] := WCMA_averageHarvest[1, i]/WCMA_MEAN[i];
      end if;

      // Calculate the WCMA_P weighting Vector
      WCMA_P[i] := i/timeSteps;
    end for;

    // Multiply WCMA_V with WCMA_P TRANSPOSED (automatically)
    // and get the SUM of the WCMA_P for the denominator
    WCMA_GAP := (WCMA_V * WCMA_P)/(WCMA_P * ones(timeSteps));

    // The WCMA equation
    WCMA_averageHarvest[1, nextHour] := alpha * WCMA_averageHarvest[1, currentHour] + (1-alpha) * WCMA_GAP * WCMA_FUTURE_PAST_MEAN;
    prediction := WCMA_averageHarvest[1, nextHour];
  end when;

  // Every day
  when sample(0, 86400) then
    // Shift entries in the WCMA_averageHarvest to the next day
    for days in 1:pastDays-1 loop
      for steps in 1:timeSteps loop
        // Yesterday (+1 day in past) is equal to Today..
        WCMA_averageHarvest[days+1,steps] := WCMA_averageHarvest[days,steps];
      end for;
    end for;
  end when;

equation
  currentHour = getHour(time, 0);
  nextHour = getHour(time, 1);

annotation(
  Icon(graphics = {Text(origin = {9, -1}, extent = {{-159, 51}, {141, -51}}, textString = "Predict\nWCMA")}));
  
end PredictWCMA;
