within EnergyHarvestingWSN.EnergyLoads.Calculators;


block CurrentLossAM
  extends EnergyHarvestingWSN.Icons.Block;
  //  parameter Real c_AM(final quantity="Capacitance", final unit="nF") = 1
  //  "Total gate capacity in active mode";
  parameter Real c1 = 1 "Fit parameter 1";
  parameter Real c2 = 1 "Fit parameter 2";
  parameter Real c3 = 1 "Fit parameter 3";
  Modelica.Blocks.Interfaces.RealInput Vdd "Operation voltage in V" annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
  Modelica.Blocks.Interfaces.RealInput f "Operation frequency in MHz" annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-110, -40})));
  Modelica.Blocks.Interfaces.RealOutput i "Current loss output in A" annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));

equation
  i = 0.001 * (c1 * f * Vdd + c2 * f * (Vdd - 1) ^ 2 + c3 * Vdd ^ 2);
  //0.001  mA -> A
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-48, 28}, {50, -30}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "AM")}));
end CurrentLossAM;
