within EnergyHarvestingWSN.Records.LDOs;
record template
  extends Modelica.Icons.Record;
  import SI = Modelica.Units.SI;
  
  parameter String typeName = "Generic";
  parameter SI.Voltage VoutSet "Output voltage setting";
  parameter SI.Current Ilimit "Output current limit";
  parameter SI.Resistance Ron "On resistance(correlates to the voltage drop)";
  parameter SI.Resistance Rleak "Input leakage resistor (correlates to Iq at given Vin)";
  
end template;
