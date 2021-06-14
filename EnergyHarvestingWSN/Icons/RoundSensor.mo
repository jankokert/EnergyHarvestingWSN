within EnergyHarvestingWSN.Icons;
  
model RoundSensor
parameter String symbol;
extends Modelica.Icons.RoundSensor;

annotation(
  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Text(extent = {{-29, -70}, {30, -11}}, textString = "%symbol%", fontName = "Arial")}));

end RoundSensor;
