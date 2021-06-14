within EnergyHarvestingWSN.Records.SuperCaps;
record YEC_25F "YEC WPL2R72561626 25F, 2.7V"
  extends EnergyHarvestingWSN.Records.SuperCaps.template(
    // The values are not yet determined - they are just copied from CapXX and set Ci0
    Ri = 150E-3,
    Ci0 = 25,
    Civ = 0.3E-3,
    Rd = 150,
    Cd = 0.07,
    Rl = 500,
    Cl = 0.2,
    Rleak = 1E6);

end YEC_25F;
