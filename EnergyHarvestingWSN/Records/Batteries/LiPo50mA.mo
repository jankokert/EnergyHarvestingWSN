within EnergyHarvestingWSN.Records.Batteries;
record LiPo50mA "LiPo with 50 mAh (Vmax=4.2V)"
  import Modelica.Units.Conversions.*;
  extends EnergyHarvestingWSN.Records.Batteries.template(
    C0 = from_Ah(0.05),
    E0 = 3.8,
    Elin = 0.0,
    Epol = 0.05,
    Av = 0.5,
    Bv = 100
  );    
end LiPo50mA;
