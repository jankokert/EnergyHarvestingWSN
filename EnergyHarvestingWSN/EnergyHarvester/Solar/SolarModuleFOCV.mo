within EnergyHarvestingWSN.EnergyHarvester.Solar;

model SolarModuleFOCV
  extends EnergyHarvestingWSN.EnergyHarvester.Solar.SolarModule;
  import SI = Modelica.Units.SI;
  
  parameter Real k_FOCV = 0.8 "MPP fraction of the open-circuit voltage";  
  Modelica.Blocks.Math.Gain fraction(k = k_FOCV * ns) annotation(
    Placement(visible = true, transformation(origin = {66, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  SolarCell solarCell1(A = A, Jsc = Jsc, cellparam = cellparam) annotation(
    Placement(visible = true, transformation(origin = {40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vMPP annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(solarCell1.p.v, fraction.u) annotation(
    Line(points = {{40, -20}, {40, 0}, {58, 0}}, color = {0, 0, 255}));
  connect(solarCell1.n, n) annotation(
    Line(points = {{40, -40}, {40, -80}, {0, -80}, {0, -100}}, color = {0, 0, 255}));
  connect(solarCell1.irradiance, irradiance) annotation(
    Line(points = {{32, -30}, {-80, -30}, {-80, 0}, {-110, 0}}, color = {0, 0, 127}));
  connect(fraction.y, vMPP) annotation(
    Line(points = {{72, 0}, {110, 0}}, color = {0, 0, 127}));
end SolarModuleFOCV;
