within EnergyHarvestingWSN.Interfaces;
connector EnergyInfo "Information bus for energy and power"
  extends EnergyHarvestingWSN.Icons.BusYellow;
  import SI = Modelica.Units.SI;
  
  SI.Power Pin "Instantanious harvested power";
  SI.Energy Eharv "Harvested energy";
  
  SI.Power Pout "Instantanious consumed power";  
  SI.Energy Econs "Consumed energy";

  SI.Energy EstoreTot "Total energy stored";
  SI.Energy EstoreDiff "Energy difference since t=0";
 
  annotation(
    Icon(graphics = {Rectangle(lineColor = {255, 204, 51}, lineThickness = 0.5, extent = {{-20, 2}, {20, -2}})}),
    Diagram(graphics = {Rectangle(lineColor = {255, 204, 51}, lineThickness = 0.5, extent = {{-20, 2}, {20, -2}})}),   
    coordinateSystem(initialScale = 0.1));
end EnergyInfo;
