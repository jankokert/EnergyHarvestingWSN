within EnergyHarvestingWSN.Utilities.UnitTests;
model SWtest
  extends Modelica.Icons.Example;
  
  EnergyHarvestingWSN.Utilities.IdealSPST idealSPST annotation(
    Placement(transformation(extent = {{-10,20},{10,40}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=1) annotation(
    Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-40,0})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=1) annotation(
    Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin={40,0})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(transformation(extent={{30,-52},{50,-32}})));

equation
  idealSPST.control = (time<1);
  connect(ground.p, resistor.n) annotation (Line(
      points={{40,-32},{40,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(resistor.p, idealSPST.n) annotation (Line(
      points={{40,10},{40,30},{10,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(idealSPST.p, constantVoltage.p) annotation (Line(
      points={{-10,30},{-40,30},{-40,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantVoltage.n, resistor.n) annotation (Line(
      points={{-40,-10},{-40,-20},{40,-20},{40,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
end SWtest;
