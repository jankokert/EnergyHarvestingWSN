within EnergyHarvestingWSN.Records.SuperCaps;
record template
  extends Modelica.Icons.Record;
  import SI = Modelica.Units.SI;

  parameter SI.Resistance Ri(start=150E-3) "Immediate resistor";
  parameter SI.Capacitance Ci0(start=0.3) "Immediate capacitance";
  parameter Real Civ(start=0.3E-3) "Immediate voltage dependancy";

  parameter SI.Resistance Rd(start=150) "Delayed resistor";
  parameter SI.Capacitance Cd(start=0.07) "Delayed capacitance";

  parameter SI.Resistance Rl(start=500) "Longterm resistor";
  parameter SI.Capacitance Cl(start=0.2) "Longterm capacitance";

  parameter SI.Resistance Rleak(start=1E6) "Leakage Resistor";
end template;
