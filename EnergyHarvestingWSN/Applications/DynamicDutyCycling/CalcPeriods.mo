within EnergyHarvestingWSN.Applications.DynamicDutyCycling;
model CalcPeriods
  import SI = Modelica.Units.SI;
  extends EnergyHarvestingWSN.Icons.Block;
  outer parameter SI.Time RAPUPeriod;
  outer EnergyHarvestingWSN.Interfaces.LoadInfo loadInfo;
  outer Storage.Rec history;
  outer Real soc;
  outer SI.Energy capacity;

  parameter SI.Energy consumption[loadInfo.ntasks] = {3.3*0.04*0.3, 4.0*0.4*1.0};  // V*I*t
  parameter Integer maxPeriod[loadInfo.ntasks] = {600, 3600};
  parameter Integer taskTau[loadInfo.ntasks] = {48, 1};

  // Task parameter variables
  //Real minExecsPerHour[loadInfo.ntasks];
  Real sumConsumption;
  //Real sumExecsPerHour;
  Real ratio[loadInfo.ntasks];
  Real batteryFactor[loadInfo.ntasks];  // To multiply with the harvest (depends on battery status)

  SI.Energy availableEnergy[loadInfo.ntasks];
  SI.Power historyPowerAverage[loadInfo.ntasks];

  Modelica.Blocks.Interfaces.RealInput prediction(unit = "W") annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.IntegerOutput idealPeriods[loadInfo.ntasks] annotation(
  Placement(visible = true, transformation(extent = {{100, -10}, {120, 10}}, rotation = 0), iconTransformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));

protected
  Real execsPerHour[loadInfo.ntasks];
  Real wPredict[loadInfo.ntasks];  // weight of the predict value
  Integer idealPeriod[loadInfo.ntasks];

initial algorithm
  for i in 1:loadInfo.ntasks loop
    idealPeriod[i] := maxPeriod[i];
    execsPerHour[i] := 0;
    availableEnergy[i] := 0;
    ratio[i] := 0;
    //minExecsPerHour[i] := 0;
    wPredict[i] := 0;
    historyPowerAverage[i] := 0;
    batteryFactor[i] := 1;
  end for;
  //sumExecsPerHour := 0;
  sumConsumption := 0;
  

algorithm

  // Calculate ratio preliminaries for n tasks at begin of simulation
  when time>1 then
    for i in 1:loadInfo.ntasks loop
      //minExecsPerHour[i] := RAPUPeriod / maxPeriod[i];
      //sumExecsPerHour := sumExecsPerHour + minExecsPerHour[i];
      sumConsumption := sumConsumption + consumption[i];
      wPredict[i] := 1/(taskTau[i]+1);
    end for;
  end when;

  // Provide periods for the individual tasks at every task execution
  when {edge(loadInfo.taskIsOn[1]), edge(loadInfo.taskIsOn[2])} then

    batteryFactor[1] := (2.0 * soc - 1) ^ 17 + 1;
    batteryFactor[2] := 5.0 * soc ^ 8;
  
    // Calculate the ideal period for n tasks
    for i in 1:loadInfo.ntasks loop
      // Calculate the ratio
      //ratio[i] := minExecsPerHour[i] / sumExecsPerHour;
      ratio[i] := consumption[i] / sumConsumption;

      // Get the average power 
      historyPowerAverage[i] := Storage.getAverage(history, taskTau[i]);

      // Calculate the available energy                  Limit to max 1/24 of capacity
      availableEnergy[i] := wPredict[i]*prediction   +   min(capacity/6,  (1-wPredict[i])*historyPowerAverage[i] * RAPUPeriod);
      availableEnergy[i] := availableEnergy[i] * ratio[i] * batteryFactor[i];

      // Calculate how often to execute per hour (minimum = 1x)
      execsPerHour[i] := max(1, floor(availableEnergy[i] / consumption[i]));

      // Calculate the task period (will be in between 1s and maxPeriod)
      idealPeriod[i] := min(maxPeriod[i], integer(ceil(RAPUPeriod / execsPerHour[i])));

      // Assign the output
      if edge(loadInfo.taskIsOn[1]) then
        idealPeriods[1] := idealPeriod[1];
      end if;
      
      if edge(loadInfo.taskIsOn[2]) then
        idealPeriods[2] := idealPeriod[2];
      end if;
      
    end for;
  end when;

annotation(
  Icon(graphics = {Text(origin = {0, -1}, extent = {{-150, 53}, {150, -53}}, textString = "Calc\nPeriods")}));
    
end CalcPeriods;
