within EnergyHarvestingWSN.Records.SolarCells;
record StandardSi
  extends EnergyHarvestingWSN.Records.SolarCells.template(
    Rp = 5000e-4, // = 5 kOhm / cm²
    Rs = 0.5e-4,  // = 0.5 Ohm / cm²
    J01 = 1e-08,  // = 1.0e-12 A / cm²
    J02 = 3e-04); // = 3.0e-8  A / cm²
end StandardSi;
