within EnergyHarvestingWSN.Records.SolarCells;
record DiscretOneDiode "Discrete diode to simulate a solar cell - actually the GBJ1506 represents two diodes (n=1.5) and thus this record is not needed..."
  extends EnergyHarvestingWSN.Records.SolarCells.template(
    Rp = 100,
    Rs = 0.00015,
    J01 = 0.6e-08,
    J02 = 0.0);
end DiscretOneDiode;
