within EnergyHarvestingWSN.Interfaces;
partial model Sink
  "Electrical sink with current iin definition"
  extends EnergyHarvestingWSN.Interfaces.TwoPin;
  import SI = Modelica.Units.SI;
    
  SI.Current iin "Current flowing from pin p into the sink";
  
equation
  0 = p.i + n.i;
  iin = p.i;

end Sink;
