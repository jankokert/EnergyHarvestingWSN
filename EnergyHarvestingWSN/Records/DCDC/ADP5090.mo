within EnergyHarvestingWSN.Records.DCDC;
record ADP5090 "ADP5090 PV and TEG energy extractor from Analog Devices"
  extends EnergyHarvestingWSN.Records.DCDC.template(
    Vstart = 0.4, // 0.38 in datasheet
    Vmin = 0.1, // 0.08 in datasheet
    Vsetmax = 5.4,
    Isetmax = 0.1,
    Gmax = 0.3,
    k1 = 0.010,  // for Vout=3V
    k2 = 0.11,
    k3 = 1.0E-6,
    k4 = 1.3,
    isVOutPowered = false);
end ADP5090;
