within EnergyHarvestingWSN.Applications.DynamicDutyCycling;
model AveragePower
  import SI = Modelica.Units.SI;
  extends EnergyHarvestingWSN.Icons.Block;  
  outer parameter SI.Time RAPUPeriod;

  parameter SI.Time measurePeriod = 60 "sampling time for power measurement";

  SI.Energy energyAcc "Accumulated power (= energy) of the current hour";

  // Storage including power history
  outer Storage.Rec history;
  outer Real powerIn;

  Modelica.Blocks.Interfaces.RealOutput powerOut(unit = "W") annotation(
  Placement(visible = true, transformation(extent = {{100, -10}, {120, 10}}, rotation = 0), iconTransformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));

initial algorithm
  energyAcc := 0;
  powerOut := 0;

algorithm
  // Calculate the harvestested energy over the time measurePeriode
  when sample(0, measurePeriod) then
    // E = Integral(P)dt = P*t with the assumption that P is constant over t
    // Calculate the average power (power = energy / 1s) every RAPUPeriod
    energyAcc := energyAcc + powerIn * measurePeriod;
  end when;

  when sample(0, RAPUPeriod) then
    powerOut := energyAcc / RAPUPeriod;
    energyAcc := 0;

    // Making modelica happy...
    for i in 1:history.length loop
      history.power[i] := history.power[i];
    end for;

    // Save changes in AveragePower.powerOut (FIFO)
    for i in (history.length-1):-1:1 loop
      history.power[i+1] := history.power[i];
    end for;
    history.power[1] := powerOut;
  end when;
  
annotation(
  Icon(graphics = {Text(origin = {0, -1}, extent = {{-150, 51}, {150, -51}}, textString = "Average\nPower")}));
  
end AveragePower;
