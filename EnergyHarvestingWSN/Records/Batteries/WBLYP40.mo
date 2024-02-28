within EnergyHarvestingWSN.Records.Batteries;
record WBLYP40 "WB-LYP40 - 40 Ah Winston battery"
  import Modelica.Units.Conversions.*;
  extends EnergyHarvestingWSN.Records.Batteries.template(
    C0 = from_Ah(40),
    R0 = 0.01,
    E0 = 3.36,
    Elin = 0.045,
    Epol = 0.02,
    Av = 0.13,
    Bv = 4.6e-005,
    ksdyr = 0.10
  );
end WBLYP40;
