within EnergyHarvestingWSN.Records.SolarCells;
record DiscretOneDiode "Discrete diode to simulate a solar cell - actually the GBJ1506 represents two diodes (n=1.5)."
  extends EnergyHarvestingWSN.Records.SolarCells.template(
    Jsc = 300,    // = 30 mA / cm²
    Rp = 100,
    Rs = 0.00015,
    J01 = 0.6e-08,
    J02 = 0.0,
    n1 = 1.5);
end DiscretOneDiode;
