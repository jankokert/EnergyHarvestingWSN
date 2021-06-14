within EnergyHarvestingWSN.Records.DCDC;
record BattCharger "Battery Charger with 0.5A"
  extends EnergyHarvestingWSN.Records.DCDC.template(
    Vstart = 5,
    Vmin = 4,
    Vsetmax = 1.38,
    Isetmax = 0.5,
    Vtrickle = 4);
end BattCharger;
