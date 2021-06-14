within EnergyHarvestingWSN.Records.Batteries;
record eneloopAA "eneloop NiMH AA cell with 2.0 Ah, 70% remaining charge after 5 years"
  import Modelica.Units.Conversions.*;
  extends EnergyHarvestingWSN.Records.Batteries.template(
    C0 = from_Ah(2),
    R0 = 0.01, //*
    Rd = 0.02, //*
    Cd = 1.0,  //*
    E0 = 1.303614,
    Elin = 0.04, //*
    Epol = 0.012503,    
    Av = 0.175,
    Bv = 0.001667
    //   * = added freely
    //Rirt = 0.080556,
    //Rel = 0.015782,
    //Br = 0.08194700000000001,
    //Trt = 298.15,
    //SDan = 0.0689,
    //kageQ = 0.4,
    //nage = 200.0
  );
end eneloopAA;
