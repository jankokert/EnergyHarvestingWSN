within EnergyHarvestingWSN.EnergyStorages.UnitTests;
model Battery_ChargeTest
  extends Modelica.Icons.Example;
  
  EnergyHarvestingWSN.EnergyStorages.Battery batt1( SOCini= 0.1,cellParam = EnergyHarvestingWSN.Records.Batteries.eneloopAA()) annotation(
    Placement(visible=true, transformation(origin = {0,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent(I=2) annotation(
    Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin = {-40,0})));
  EnergyHarvestingWSN.Utilities.Ground ground1 annotation(
    Placement(visible=true, transformation(origin={0,-40}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
  EnergyHarvestingWSN.Utilities.Ground ground2 annotation(
    Placement(visible=true, transformation(origin={-40,-40}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));

equation
  connect(ground1.p,batt1.n) annotation(
    Line(points = {{0,-30},{0,-10}}, color = {0,0,255}, smooth = Smooth.None));
  connect(constantCurrent.n, batt1.p) annotation(
   Line(points = {{-40,10},{-40,20},{0,20},{0,10}}, color = {0,0,255}, smooth = Smooth.None));
  connect(ground2.p, constantCurrent.p) annotation(
    Line(points = {{-40,-30},{-40,-10}}, color = {0,0,255}, smooth = Smooth.None));

  annotation (
  Documentation(info="<?xml version='1.0'?>
<html xmlns='http://www.w3.org/1999/xhtml'>
  <head>...</head>
  <body>
    <h1>Beispiel</h1>
    ....
    <math xmlns='http://www.w3.org/1998/Math/MathML'>
      <mi>x</mi><mo>+</mo><mn>3</mn>
    </math>
  </body>
</html>"),
  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),            graphics));
end Battery_ChargeTest;
