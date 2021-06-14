within EnergyHarvestingWSN.Records.Batteries;
record LP053048 "BiPower 760 mAh Li-Ion rechargable battery"
  import Modelica.Units.Conversions.*;
  extends EnergyHarvestingWSN.Records.Batteries.template(
    C0 = from_Ah(0.76),
    Rirt = 0.142544,
    Rel = 0.036693,
    Br = 0.046472,
    Trt = 298.15,
    Av = 0.405,
    Bv = 0.002193,
    E0 = 3.813537,
    Epol = 0.02187,
    SDan = 0.15,
    kageQ = 0.03,
    nage = 100.0
  );
end LP053048;
