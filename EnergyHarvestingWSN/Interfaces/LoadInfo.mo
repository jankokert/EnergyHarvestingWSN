within EnergyHarvestingWSN.Interfaces;
expandable connector LoadInfo "Information bus for the load states"
  extends EnergyHarvestingWSN.Icons.BusRed;
  
  parameter Integer ntasks = 2 "Total number of tasks";  
  Real periods[ntasks];
  Boolean taskIsOn[ntasks] (each fixed = true, each start = false);

  annotation(
    Icon(graphics = {Rectangle(lineColor = {255, 0, 0}, lineThickness = 0.5, extent = {{-20, 2}, {20, -2}})}, coordinateSystem(initialScale = 0.1)),
    Diagram(graphics = {Rectangle(lineColor = {255, 0, 0}, lineThickness = 0.5, extent = {{-20, 2}, {20, -2}})}, coordinateSystem(initialScale = 0.1)),   
    coordinateSystem(initialScale = 0.1));

end LoadInfo;
