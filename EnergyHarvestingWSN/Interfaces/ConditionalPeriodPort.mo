within EnergyHarvestingWSN.Interfaces;
partial model ConditionalPeriodPort
  "Partial model to include an optional period input"

  import SI = Modelica.Units.SI;
  parameter Boolean useExternalPeriod = false annotation(
    Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter SI.Time fixedPeriod = 1 "Fixed period if useExternalPeriod = false" annotation(
    Dialog(enable=not useExternalPeriod));

  EnergyHarvestingWSN.Interfaces.TimePort periodPort (t(start=1)=period) if useExternalPeriod annotation(
    Placement(visible = true, transformation(extent = {{-120, -10}, {-100, 10}}, rotation = 0), iconTransformation(extent = {{-120, -10}, {-100, 10}}, rotation = 0)));

  SI.Time period; 

equation
  if not useExternalPeriod then
    period = fixedPeriod;
  end if;

end ConditionalPeriodPort;
