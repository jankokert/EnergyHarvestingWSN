within EnergyHarvestingWSN.Utilities;
model CellStack
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.CenterLabel;
  extends EnergyHarvestingWSN.Interfaces.ThreePin;
  import SI = Modelica.SIunits;

  parameter Integer ns = 1 "Number of series elements";
  parameter Integer np = 1 "Number of parallel elements";

equation
  Vout = ns * Vin;
  Iout = np * Iin;
  n.i = 0;

annotation(
    Icon(graphics = {Text(origin = {1, -50},textColor = {255, 170, 0}, extent = {{-87, 22}, {87, -22}}, textString = "%ns s    %np p")}));
end CellStack;
