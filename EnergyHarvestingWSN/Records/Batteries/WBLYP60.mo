within EnergyHarvestingWSN.Records.Batteries;
record WBLYP60 "WB-LYP60 - 60 Ah Winston battery"
  import Modelica.Units.Conversions.*;
  extends EnergyHarvestingWSN.Records.Batteries.template(
    C0 = from_Ah(60),
    R0 = 0.001111,
    E0 = 3.220702,
    Elin = 0.045,
    Epol = 0.007369,
    Av = 0.03,
    Bv = 4.6e-005,
    ksdyr = 0.10
  );
end WBLYP60;
