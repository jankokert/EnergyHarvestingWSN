within EnergyHarvestingWSN.Records.DCDC;
record CCCV_LiPo_Charger "CCCC_LiPo_Charger ideal 3A"
  extends EnergyHarvestingWSN.Records.DCDC.template(
    Vstart = 5,
    Vmin = 4,
    Vsetmax = 3.55,
    Isetmax = 3);
end CCCV_LiPo_Charger;
