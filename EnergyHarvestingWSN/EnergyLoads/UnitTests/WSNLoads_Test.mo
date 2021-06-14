within EnergyHarvestingWSN.EnergyLoads.UnitTests;

model WSNLoads_Test
  extends Modelica.Icons.Example;
  
  EnergyHarvestingWSN.EnergyLoads.PeriodicCurrent load() annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 1)  annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 25, v(fixed = true, start = 3))  annotation(
    Placement(visible = true, transformation(origin = {-40, 2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(capacitor1.p, resistor1.p) annotation(
    Line(points = {{-40, 12}, {-40, 12}, {-40, 20}, {-10, 20}, {-10, 20}}, color = {0, 0, 255}));
  connect(capacitor1.n, ground2.p) annotation(
    Line(points = {{-40, -8}, {-40, -8}, {-40, -20}, {-40, -20}}, color = {0, 0, 255}));
  connect(resistor1.n, load.p) annotation(
    Line(points = {{10, 20}, {50, 20}, {50, 10}, {50, 10}}, color = {0, 0, 255}));
  connect(ground1.p, load.n) annotation(
    Line(points = {{50, -20}, {50, -20}, {50, -20}, {50, -20}, {50, -18}, {50, -18}, {50, -10}, {50, -10}}, color = {0, 0, 255}));
  annotation(
    Documentation(info = "info"), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end WSNLoads_Test;
