within EnergyHarvestingWSN.Records.Batteries;
record CR2032_Panasonic "CR2032 button cell with 250 mAh"
  import Modelica.Units.Conversions.*;
  extends EnergyHarvestingWSN.Records.Batteries.template(
    C0 = from_Ah(0.25),
    R0 = 0.1,
    Rd = 0.02,  // only for RC-model
    Cd = 1.0,   // only for RC-model
    E0 = 3.0,
    Elin = 0.04,
    Epol = 0.037895,
    Av = 0.01,
    Bv = 0.04386    
  );
end CR2032_Panasonic;
