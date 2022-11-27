within EnergyHarvestingWSN.Interfaces;

partial model PartialPowerConverter
  extends EnergyHarvestingWSN.Interfaces.ThreePin;
  import SI = Modelica.Units.SI;

  parameter SI.Voltage Voutset(start=0) "Settable output voltage";
  parameter SI.Current Ioutset(start=0) "Settable output current";
     
  SI.Power PWRout, PWRin;
  SI.Efficiency effCalc;

  // the "inner" prefix provides the following variables for blocks within this model
  inner SI.Voltage Vin(start=0);
  inner SI.Voltage Vout(start=0);
  inner SI.Current Iin, Iout;
  inner Boolean isOn;
  
  inner SI.Voltage Vset;
  inner SI.Current Iset;
 
equation
  Vin = pin.v - n.v;
  Iin = pin.i;
  Vout = pout.v - n.v;
  Iout = -pout.i;
  PWRout = Vout * Iout;
  PWRin = Vin * Iin;
  
  // +1E-10 is needed if converter is forced to switch off
  effCalc = if PWRin > 1E-6 and PWRout > 1E-6 then PWRout / (PWRin + 1E-10) else 0;
  
  // check if param Voutset or Ioutset is provided. If not, get the values from the record
  Vset = if Voutset > 0 then min(Voutset, param.Vsetmax) else param.Vsetmax;
  Iset = if Ioutset > 0 then min(Ioutset, param.Isetmax) else param.Isetmax;
  
  annotation(    
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {79, -41}, lineColor = {230, 230, 230}, extent = {{-11, -27}, {9, -47}}, textString = "%param", fontSize = 1)}));
end PartialPowerConverter;
