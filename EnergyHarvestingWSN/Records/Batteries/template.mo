within EnergyHarvestingWSN.Records.Batteries;
record template
  extends Modelica.Icons.Record;
  import SI = Modelica.Units.SI;
  import Modelica.Units.Conversions.*;
  
  parameter SI.ElectricCharge C0(displayUnit="A.h") = from_Ah(1) "Nominal capacity";  
  parameter SI.Resistance R0 = 0.1 "I_R electric portion";
  parameter SI.Resistance Rd = 0 "I_R polarization resistance of ion diffusion";
  parameter SI.Capacitance Cd(displayUnit="A.h") = 0 "I_R polarization capacitance of ion diffusion";

  parameter Real Av = 0.1 "Exp. zone amplitude";
  parameter SI.Time Bv = 1 "Exp. zone time constant";
  parameter SI.Voltage E0 = 1 "No-load voltage";
  parameter SI.Voltage Epol = 0 "Polarization voltage";

  parameter SI.Resistance RselfDis = 1E6 "Self discharge resistor";
  parameter Real kageQ = 0 "Capacity decrease per 100 cycles";
  parameter Real nage = 0 "Cycle count at which aging starts";

end template;

