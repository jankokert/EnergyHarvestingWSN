within EnergyHarvestingWSN.Interfaces;

model PartialSolar
  extends EnergyHarvestingWSN.Icons.SolarCell;
  extends EnergyHarvestingWSN.Interfaces.TwoPin;
  import SI = Modelica.Units.SI;

  parameter EnergyHarvestingWSN.Records.SolarCells.template cellparam annotation(
    __Dymola_choicesAllMatching = true, Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  parameter SI.Area A(final displayUnit = "cm2") = 0.01 "Active area of one single cell (default = 1dm²)";
  parameter Real Jsc(final unit = "A/W/m2") = 0.37 "Short-circuit current per area and one sun";

  Modelica.Blocks.Interfaces.RealInput irradiance(final quantity = "Irradiance", final unit = "W/m2") "Input irradiance" annotation(
    Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  SI.Current iout "Current flowing out of pin p";
  SI.Power Pirr "Irridated input power";
  SI.Power Pout "Electrical output power";
  SI.Efficiency eff;

equation
  iout = -p.i;
  Pout = v * iout;
  
  // Modelica devides Pout/Pin even if = false!
  eff = if Pirr > 0 then Pout / (Pirr + 1E-9) else 0;

  
end PartialSolar;
