within EnergyHarvestingWSN.Interfaces;
partial model Source
  "Electrical source with current Iout definition"
  extends EnergyHarvestingWSN.Interfaces.TwoPin;
  import SI = Modelica.Units.SI;
  
  SI.Current Iout "Current flowing out of pin p";

equation
  0 = p.i + n.i;
  Iout = -p.i;
  
end Source;
