within EnergyHarvestingWSN.Utilities;
model ScaleVI
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.CenterLabel;
  extends Modelica.Electrical.Analog.Interfaces.FourPin;
  import SI = Modelica.SIunits;

  parameter Integer k_V = 1 "Voltage scaling factor";
  parameter Integer k_I = 1 "Current scaling factor";

equation
  i2 + k_I * i1 = 0;
  n2.i + k_I * n1.i = 0;  
  v2 = k_V * v1;
  n2.v = n1.v;

end ScaleVI;
