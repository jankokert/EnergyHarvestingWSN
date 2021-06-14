within EnergyHarvestingWSN.Records.DCDC;
record LT3652 "LT3652"
  extends EnergyHarvestingWSN.Records.DCDC.template(
    Vstart = 7.5,
    Vmin = 5.0,
    Vsetmax = 20,
    Isetmax = 2.0,
    k1 = 0.01,  // not fitted yet
    k2 = 0.10,
    k3 = 1E-3,
    k4 = 1,
    isVOutPowered = false);
end LT3652;

