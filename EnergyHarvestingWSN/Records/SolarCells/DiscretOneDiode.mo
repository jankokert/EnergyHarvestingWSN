within EnergyHarvestingWSN.Records.SolarCells;
record DiscretOneDiode "Discrete diode to simulate a solar cell - actually the GBJ1506 represents two diodes (n=1.5)."
  extends EnergyHarvestingWSN.Records.SolarCells.template(
    Jsc = 300,    // = 30 mA / cm²
    Rp = 1e6,     // not used
    Rs = 0.5e-4,
    J01 = 6.14e-05,  // 500 mV at 1 mA and n = 1.55
    J02 = 1e-18,  // J2 is not used
    n1 = 1.55);
end DiscretOneDiode;
