within EnergyHarvestingWSN.Records.LDOs;
record MCP1700_3V3 "MCP1700 with 3.3V"
  extends EnergyHarvestingWSN.Records.LDOs.template(
    final typeName = "MCP1700 3.3V",
    VoutSet = 3.3,
    Ilimit = 0.4,
    Ron = 0.5,
    Rleak = 1E5);

end MCP1700_3V3;
