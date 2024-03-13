within EnergyHarvestingWSN.Utilities.UnitTests;
model MultiTest
  extends Modelica.Icons.Example;

  EnergyHarvestingWSN.Utilities.CellStack stack(ns=3, np=2) annotation(
    Placement(transformation(origin = {0, -2}, extent = {{-10, -8}, {10, 12}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=1) annotation(
    Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-48,0})));
  EnergyHarvestingWSN.Utilities.Ground ground annotation(
    Placement(transformation(origin = {28, 2}, extent = {{-38, -52}, {-18, -32}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=100) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={48,0})));
equation
  connect(stack.pin, constantVoltage.p) annotation(
    Line(points = {{-10, 6}, {-20, 6}, {-20, 20}, {-48, 20}, {-48, 10}}, color = {0, 0, 255}));
  connect(stack.pout, resistor.p) annotation(
    Line(points = {{10, 6}, {20, 6}, {20, 20}, {48, 20}, {48, 10}}, color = {0, 0, 255}));
  connect(constantVoltage.n, ground.p) annotation(
    Line(points = {{-48, -10}, {-48, -20}, {0, -20}, {0, -30}}, color = {0, 0, 255}));
  connect(stack.n, ground.p) annotation(
    Line(points = {{0, -10}, {0, -30}}, color = {0, 0, 255}));
  connect(resistor.n, stack.n) annotation(
    Line(points = {{48, -10}, {48, -20}, {0, -20}, {0, -10}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
end MultiTest;
