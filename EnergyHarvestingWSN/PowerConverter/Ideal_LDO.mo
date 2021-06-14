within EnergyHarvestingWSN.PowerConverter;
model Ideal_LDO
  extends EnergyHarvestingWSN.Interfaces.PartialPowerConverter;
  extends EnergyHarvestingWSN.Icons.LDO;  
  import SI = Modelica.Units.SI;
  
  parameter SI.Voltage VoutSet;
  
algorithm
  when initial() then
    isOn := true;
  end when;
  
equation
  Vout = min(VoutSet, max(0, Vin));
  Iout = Iin;
  n.i = 0;

end Ideal_LDO;
