within EnergyHarvestingWSN.Utilities.UnitTests;
model MultiTest
  extends Modelica.Icons.Example;

  EnergyHarvestingWSN.Utilities.uiMulitple uiMulitple(kV=3, kI=2) annotation(
    Placement(transformation(extent={{-10,-8},{10,12}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=1) annotation(
    Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-48,0})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(extent = {{-38, -52}, {-18, -32}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=100) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={48,0})));

equation
  connect(ground.p, constantVoltage.n) annotation (Line(
      points = {{-28, -32}, {-28, -10}, {-48, -10}},
      color={0,0,255}));
  connect(constantVoltage.p, uiMulitple.p1) annotation (Line(
      points={{-48,10},{-30,10},{-30,7},{-10,7}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(uiMulitple.n1, constantVoltage.n) annotation (Line(
      points={{-10,-3},{-28,-3},{-28,-10},{-48,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(uiMulitple.p2, resistor.p) annotation (Line(
      points={{10,7},{30,7},{30,10},{48,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(uiMulitple.n2, resistor.n) annotation (Line(
      points={{10,-3},{30,-3},{30,-10},{48,-10}},
      color={0,0,255},
      smooth=Smooth.None));

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
end MultiTest;
