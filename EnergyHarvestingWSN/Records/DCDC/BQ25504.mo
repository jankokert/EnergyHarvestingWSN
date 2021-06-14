within EnergyHarvestingWSN.Records.DCDC;
record BQ25504 "BQ25504 PV and TEG energy extractor from Texas Instruments"
  extends EnergyHarvestingWSN.Records.DCDC.template(
    Vstart = 0.6,
    Vmin = 0.15,  // 0.13 in datasheet
    Vsetmax = 5.4,
    Isetmax = 0.25,
    k1 = 0.011,  // for Vout=3V
    k2 = 0.095,
    k3 = 2.0E-6,
    k4 = 0.2,
    isVOutPowered = true);
end BQ25504;
