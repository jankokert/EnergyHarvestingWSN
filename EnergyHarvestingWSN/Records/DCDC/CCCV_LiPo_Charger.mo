within EnergyHarvestingWSN.Records.DCDC;
record CCCV_LiPo_Charger "CCCC_LiPo_Charger ideal 3A"
  extends EnergyHarvestingWSN.Records.DCDC.template(
    Vstart = 5,
    Vmin = 4,
    Vset = 3.55,
    Iset = 3,
    Vdrop = 1,
    Idrop = 3,
    Vtrickle = 4,
    keffmax = 1,
    keffiout = 0.0,
    keffvout = 0.0,
    ChargeStop = 0);
end CCCV_LiPo_Charger;
