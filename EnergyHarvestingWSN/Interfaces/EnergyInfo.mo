within EnergyHarvestingWSN.Interfaces;
expandable connector EnergyInfo "Information bus for energy and power"
  extends EnergyHarvestingWSN.Icons.BusYellow;
  import SI = Modelica.Units.SI;
  
  SI.Power Pin "Instantanious harvested power";
  SI.Power Pout "Instantanious consumed power";  
  SI.Energy EstoreTot "Total energy stored";
  SI.Energy EstoreDiff "Energy difference since t=0";
  SI.Energy Ecapacity "Max energy storage capacity";
  SI.Energy Econs "Consumed energy";
  SI.Energy Eharv "Harvested energy";
  SI.Voltage Vmpp "Voltage at the MPPT for energy extraction";

  annotation(
    Icon(graphics = {Rectangle(lineColor = {255, 204, 51}, lineThickness = 0.5, extent = {{-20, 2}, {20, -2}})}),
    Diagram(graphics = {Rectangle(lineColor = {255, 204, 51}, lineThickness = 0.5, extent = {{-20, 2}, {20, -2}})}),   
    coordinateSystem(initialScale = 0.1));
end EnergyInfo;
