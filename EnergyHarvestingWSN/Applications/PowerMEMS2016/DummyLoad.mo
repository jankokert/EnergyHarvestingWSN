within EnergyHarvestingWSN.Applications.PowerMEMS2016;
record DummyLoad
  extends EnergyHarvestingWSN.Records.LoadCases.template(
    ntasks = 1,
    onCurrents = {0.1},
    offCurrents = {0.01},
    onTimes = {0.1},
    delays = {0.0},
    periods = {10});        
end DummyLoad;
