within EnergyHarvestingWSN.Records.Batteries;
record CR2032_Panasonic "CR2032 button cell with 250 mAh"
  import Modelica.Units.Conversions.*;
  extends EnergyHarvestingWSN.Records.Batteries.template(
    C0 = from_Ah(0.25),
    R0 = 0.1,
    E0 = 3.0,
    Elin = 0.04,
    Epol = 0.037895,
    Av = 0.01,
    Bv = 0.04386,
    ksdyr = 0.01
  );
end CR2032_Panasonic;
