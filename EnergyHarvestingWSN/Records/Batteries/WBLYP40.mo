within EnergyHarvestingWSN.Records.Batteries;
record WBLYP40 "WB-LYP40 - 40 Ah Winston battery"
  import Modelica.Units.Conversions.*;
  extends EnergyHarvestingWSN.Records.Batteries.template(
    C0 = from_Ah(40),
    R0 = 0.010000,
    E0 = 3.360000,
    Epol = 0.020000,
    Av = 0.130000,
    Bv = 4.6e-005,
    // self dis
    RselfDis = 2087.4894,    
    kageQ = 0.005500,
    nage = 1000.0,
    // RC
    Rd = 0.020000,
    Cd = 100.000000
  );
end WBLYP40;
