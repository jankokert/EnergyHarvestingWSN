within EnergyHarvestingWSN.Records.SolarCells;
record template
  extends Modelica.Icons.Record;
  import SI = Modelica.Units.SI;
  
  parameter SI.CurrentDensity Jsc(final displayUnit="mA/cm2") "Short-circuit current density";
  parameter Real Rp(final quantity = "Area Resistance", final unit = "Ohm.m2", final displayUnit="Ohm.cm2")
    "Shunt resistance";
  parameter Real Rs(final quantity = "Area Resistance", final unit = "Ohm.m2", final displayUnit="Ohm.cm2")
    "Series resistance";
  parameter SI.CurrentDensity J01(final displayUnit="mA/cm2") "Current density in emitter region (D1)";
  parameter SI.CurrentDensity J02(final displayUnit="mA/cm2") "Current density in space charge region (D2)";
  parameter Real n1 = 1 "Ideality factor D1";
  parameter Real n2 = 2 "Ideality factor D2";
end template;
