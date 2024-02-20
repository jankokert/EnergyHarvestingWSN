within EnergyHarvestingWSN.Records.Batteries;
record eneloopAA "eneloop NiMH AA cell with 2.0 Ah, 70% remaining charge after 5 years"
  import Modelica.Units.Conversions.*;
  extends EnergyHarvestingWSN.Records.Batteries.template(
    C0 = from_Ah(2),
    R0 = 0.01,
    E0 = 1.303614,
    Elin = 0.2,
    Epol = 0.012503,
    Av = 0.175,
    Bv = 0.001667
    //kageQ = 0.4,
    //nage = 200.0
  );
end eneloopAA;
