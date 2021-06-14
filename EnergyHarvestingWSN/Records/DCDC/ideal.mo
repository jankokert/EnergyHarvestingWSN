within EnergyHarvestingWSN.Records.DCDC;
record ideal "ideal DCDC with high eff"
  extends EnergyHarvestingWSN.Records.DCDC.template(
    Vstart = 0,
    Vmin = 0,
    Vsetmax = 5,
    Isetmax = 1,
    k1 = 0,
    k2 = 0,
    k3 = 0,
    k4 = 0,
    isVOutPowered = true);
end ideal;

