within EnergyHarvestingWSN.Components;

model EnergyAnalysis "Information bus for energy and power"
  import SI = Modelica.Units.SI;
  SI.Power Pharv "Instantanious harvested power";
  SI.Energy Eharv "Harvested energy";
  SI.Power Pcons "Instantanious consumed power";
  SI.Energy Econs "Consumed energy";
  SI.Power Pstore "Instantanious stored power";
  SI.Energy Estore "Energy stored since t=0";
  
  SI.Energy EstoreAbs "Absolut amount of energy in storage";
  SI.Energy EstoreMax "Maximum storabe energy in storage";
  
  SI.Energy Ech, Edisch "Charging and discharging Energy";
  Real EFFsys;
  
initial equation
  Estore = 0;
  Econs = 0;
  Eharv = 0;
  
equation
  der(Eharv) = Pharv;
  der(Estore) = Pstore;
  der(Ech) = max(0, Pstore);
  der(Edisch) = max(0, -Pstore); 
  der(Econs) = Pcons;
    
  EFFsys = max(0, (Econs + Estore) / (Eharv + 1E-6));

  
  
  annotation(
    Icon(graphics = {Rectangle(lineColor = {255, 204, 51}, lineThickness = 0.5, extent = {{-20, 2}, {20, -2}})}),
    Diagram,
    coordinateSystem(initialScale = 0.1));
end EnergyAnalysis;
