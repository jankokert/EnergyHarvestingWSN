within EnergyHarvestingWSN.Interfaces;
partial model Sink
  "Electrical sink with current Iin definition"
  extends EnergyHarvestingWSN.Interfaces.TwoPin;
  import SI = Modelica.Units.SI;
    
  SI.Current Iin "Current flowing from pin p into the sink";
  
equation
  0 = p.i + n.i;
  Iin = p.i;

end Sink;
