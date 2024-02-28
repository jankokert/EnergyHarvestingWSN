within EnergyHarvestingWSN.Records.Batteries;
record template
  extends Modelica.Icons.Record;
  import SI = Modelica.Units.SI;
  import Modelica.Units.Conversions.*;
  
  parameter SI.ElectricCharge C0(displayUnit="A.h") = from_Ah(1) "Nominal capacity";  
  parameter SI.Resistance R0 = 0.1 "I_R electric portion";

  parameter SI.Voltage E0 = 1 "No-load voltage";
  parameter SI.Voltage Elin = 1 "Linear voltage drop of Voc with SoC";
  parameter SI.Voltage Epol = 0 "Polarization voltage";
  parameter Real Av = 0.1 "Exp. zone amplitude";
  parameter SI.Time Bv = 1 "Exp. zone exponent constant";

  parameter SI.Frequency ksdyr(displayUnit="yr-1") = 0 "Annual self discharge rate";

end template;

