within EnergyHarvestingWSN.Records.SuperCaps;
record Zubieta_470F "Cap from Zubieta paper 470F, 2.3V"
  extends EnergyHarvestingWSN.Records.SuperCaps.template(
    Ri = 0.0025,
    Ci0 = 270,
    Civ = 190,
    Rd = 0.9,
    Cd = 100,
    Rl = 5.2,
    Cl = 220,
    Rleak = 9000);
end Zubieta_470F;
