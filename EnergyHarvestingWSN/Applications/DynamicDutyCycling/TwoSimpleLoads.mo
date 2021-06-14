within EnergyHarvestingWSN.Applications.DynamicDutyCycling;
record TwoSimpleLoads "Task1: Radio Tx; Task2: DummyLoad"
  extends EnergyHarvestingWSN.Records.LoadCases.template(
    ntasks = 2,
    onCurrents = {0.04, 0.4},
    offCurrents = {0.0, 0.0},
    onTimes = {0.3, 1.0},
    delays = {0.0, 0.0},
    periods = {10, 10});
end TwoSimpleLoads;
