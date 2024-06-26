within EnergyHarvestingWSN.Interfaces;
expandable connector EnergyInfo "Information bus for energy and power"
  extends EnergyHarvestingWSN.Icons.BusYellow;
  import SI = Modelica.Units.SI;
  
  SI.Power Pharv "Instantanious harvested power";
  SI.Energy Eharv "Harvested energy";
  
  SI.Power Pcons "Instantanious consumed power";  
  SI.Energy Econs "Consumed energy";

  SI.Power Pstore "Instantanious stored power";
  SI.Energy Estore "Energy stored since t=0";
  
  SI.Energy EstoreAbs "Abolut amount of energy in storage";
  SI.Energy EstoreMax "Maximum storabe energy in storage";
  
  SI.Energy Ech, Edisch "Charging and discharging Energy";
 
  annotation(
    Icon(graphics = {Rectangle(lineColor = {255, 204, 51}, lineThickness = 0.5, extent = {{-20, 2}, {20, -2}})}),
    Diagram(graphics = {Rectangle(lineColor = {255, 204, 51}, lineThickness = 0.5, extent = {{-20, 2}, {20, -2}})}),   
    coordinateSystem(initialScale = 0.1));
end EnergyInfo;
