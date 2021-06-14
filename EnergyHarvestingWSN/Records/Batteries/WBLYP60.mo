within EnergyHarvestingWSN.Records.Batteries;
record WBLYP60 "WB-LYP60 - 60 Ah Winston battery"
  import Modelica.Units.Conversions.*;
  extends EnergyHarvestingWSN.Records.Batteries.template(
    C0 = from_Ah(60),
    Rirt = 0.001111,
    Rel = 0.000569,
    Br = 0.054188,
    Trt = 298.15,
    Av = 0.03,
    Bv = 4.6e-005,
    E0 = 3.220702,
    Epol = 0.007369,
    SDan = 0.3,
    kageQ = 0.0055,
    nage = 1000.0
  );
end WBLYP60;
