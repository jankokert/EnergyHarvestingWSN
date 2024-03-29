within EnergyHarvestingWSN.Records.DCDC;
record template
  extends Modelica.Icons.Record;
  import SI = Modelica.Units.SI;
  
  parameter SI.Voltage Vstart "Minimum input voltage for cold start";
  parameter SI.Voltage Vmin "Minimum input voltage after cold start";
  parameter SI.Voltage Vsetmax "Max of settable output voltage";
  parameter SI.Current Isetmax = 1 "Max of settable output current";
  parameter SI.Conductance Gmax = 0.5 "Max input conductance (max 0.5A @ 1V)";
  parameter Boolean isVOutPowered "Controller startup circuit is additionally powerered from Vout";

  parameter Real k1 "Linear Iin dependency";
  parameter Real k2 "Iin*sqrt(Vin) dependency";
  parameter Real k3 "Constant power loss";
  parameter Real k4 "Iin^2 dependency";
end template;
