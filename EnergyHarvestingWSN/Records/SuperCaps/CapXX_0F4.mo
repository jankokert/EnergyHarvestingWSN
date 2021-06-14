within EnergyHarvestingWSN.Records.SuperCaps;
record CapXX_0F4 "Cap from CapXX 0.4F, 5.5V"
  extends EnergyHarvestingWSN.Records.SuperCaps.template(
    Ri = 150E-3,
    Ci0 = 0.33,
    Civ = 0.03,
    Rd = 150,
    Cd = 0.07,
    Rl = 500,
    Cl = 0.2,
    Rleak = 1E6);
end CapXX_0F4;
