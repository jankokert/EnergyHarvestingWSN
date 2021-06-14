within EnergyHarvestingWSN.Interfaces;
expandable connector EnvironmentInfo "Information bus for environment states"
  extends EnergyHarvestingWSN.Icons.BusBlue;
  import SI = Modelica.Units.SI;
  
  SI.Irradiance Irr "Irradiance";
  
  annotation(
    Icon(graphics = {Rectangle(lineColor = {0, 170, 255}, lineThickness = 0.5, extent = {{-20, 2}, {20, -2}})}, coordinateSystem(initialScale = 0.1)),
    Diagram(graphics = {Rectangle(lineColor = {0, 170, 255}, lineThickness = 0.5, extent = {{-20, 2}, {20, -2}})}, coordinateSystem(initialScale = 0.1)),   
    coordinateSystem(initialScale = 0.1));
end EnvironmentInfo;
