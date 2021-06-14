within EnergyHarvestingWSN.Records.MicroControllers;
record template
  extends Modelica.Icons.Record;
  //  parameter Real C_AM(final quantity="Capacitance", final unit="nF") = 1
  //    "Total gate capacity in active mode";
  parameter Real c1AM = 1 "AM Fit parameter 1 (active capacity in nF)";
  parameter Real c2AM = 1 "AM Fit parameter 2";
  parameter Real c3AM = 1 "AM Fit parameter 3";
  parameter Real c1LPM = 1 "LPM Fit parameter 1 (current in uA)";
  parameter Real saveOpTable[:, 2] = fill(0, 0, 2)
    "Vdd in V = first column, Operation frequency in MHz = second column";
  annotation(defaultComponentPrefixes = "parameter");
end template;
