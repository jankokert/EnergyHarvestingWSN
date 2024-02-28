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
    ksdyr = 0.45  // approx. 5% per month
  );
end LP053048;
