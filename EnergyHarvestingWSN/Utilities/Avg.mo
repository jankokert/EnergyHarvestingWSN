within EnergyHarvestingWSN.Utilities;
model Avg
  extends Modelica.Blocks.Interfaces.SISO;
  Real x;
  
initial equation
  x = 0;
  
equation
  der(x) = u;
  if time>1 then
      y = x/time;
  else
    y = 0;
  end if;
end Avg;
