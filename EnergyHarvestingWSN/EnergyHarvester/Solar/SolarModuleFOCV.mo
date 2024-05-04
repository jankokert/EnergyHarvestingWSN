within EnergyHarvestingWSN.EnergyHarvester.Solar;

model SolarModuleFOCV
  extends EnergyHarvestingWSN.EnergyHarvester.Solar.SolarModule;
  import SI = Modelica.Units.SI;
  
  parameter Real k_FOCV = 0.8 "MPP fraction of the open-circuit voltage";  
  Modelica.Blocks.Math.Gain fraction(k = k_FOCV * ns) annotation(
    Placement(transformation(origin = {-10, 0}, extent = {{-6, -6}, {6, 6}})));
  SolarCell pilotCell(A = A, param = param) annotation(
    Placement(transformation(origin = {-30, -12}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Interfaces.RealOutput vMPP annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  pilotCell.Vout = fraction.u;
  connect(pilotCell.n, n) annotation(
    Line(points = {{-30, -18}, {-30, -20}, {0, -20}, {0, -100}}, color = {0, 0, 255}));
  connect(fraction.y, vMPP) annotation(
    Line(points = {{-3, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(irradiance, pilotCell.irradiance) annotation(
    Line(points = {{-110, 0}, {-96, 0}, {-96, -12}, {-35, -12}}, color = {0, 0, 127}));

annotation(
    Diagram(graphics = {Line(origin = {-30, 0}, points = {{18, 0}, {0, 0}, {0, -6}}, color = {0, 0, 127})}, coordinateSystem(extent = {{-100, 100}, {100, -100}})));
end SolarModuleFOCV;
