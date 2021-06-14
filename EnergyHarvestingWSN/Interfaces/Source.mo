within EnergyHarvestingWSN.Interfaces;
partial model Source
  "Electrical source with current iout definition"
  extends EnergyHarvestingWSN.Interfaces.TwoPin;
  import SI = Modelica.Units.SI;
  
  SI.Current iout "Current flowing out of pin p";

equation
  0 = p.i + n.i;
  iout = -p.i;
  
end Source;
