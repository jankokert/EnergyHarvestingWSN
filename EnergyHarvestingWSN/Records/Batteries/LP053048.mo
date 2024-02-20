within EnergyHarvestingWSN.Records.Batteries;
record LP053048 "BiPower 760 mAh Li-Ion rechargable battery"
  import Modelica.Units.Conversions.*;
  extends EnergyHarvestingWSN.Records.Batteries.template(
    C0 = from_Ah(0.76),
    E0 = 3.813537,
    Elin = 0.0,
    Epol = 0.02187,
    Av = 0.405,
    Bv = 0.002193,
    // self dis
    kageQ = 0.03,
    nage = 100.0
  );
end LP053048;
