within EnergyHarvestingWSN.Records.SolarCells;
record template
  extends Modelica.Icons.Record;
  import SI = Modelica.Units.SI;
  
  parameter Real Rp(final quantity = "Area Resistance", final unit = "Ohm.m2") "Parallel (shunt) resistance in Ohm m^2";
  parameter Real Rs(final quantity = "Area Resistance", final unit = "Ohm.m2") "Serial resistance in Ohm m^2";
  parameter SI.CurrentDensity J01 "Current density in emitter region (D1) in A/m^2";
  parameter SI.CurrentDensity J02 "Current density in space charge region (D2) in A/m^2";
  parameter Real n1 = 1 "Idealy Factor D1";
  parameter Real n2 = 2 "Idealy Factor D2";
end template;
