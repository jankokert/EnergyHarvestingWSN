within EnergyHarvestingWSN.EnergyLoads;
model DutyResistorParam
  parameter Real activeResistor;
  parameter Real sleepResistor;
  
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput dutyCycle annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}}), iconTransformation(extent = {{-71, -10}, {-51, 10}})));

  Modelica.Electrical.Analog.Basic.VariableResistor resistor annotation(
    Placement(transformation(extent={{-10,-10},{10,10}}, rotation=270, origin={0,0})));

equation
  1/resistor.R = dutyCycle/activeResistor  +  (1-dutyCycle)/sleepResistor;
  connect(resistor.p, p) annotation(
    Line(points = {{0,10},{0,100}}, color = {0,0,255}, smooth = Smooth.None));
  connect(resistor.n, n) annotation(
    Line(points = {{0,-10},{0,-100}}, color = {0,0,255}, smooth = Smooth.None));

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={
    Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid),
    Line(points = {{0, 90}, {0, 50}}, color = {0, 0, 0}),
    Line(points = {{0, -50}, {0, -90}}, color = {0, 0, 0}),
    Line(points = {{50, 0}, {-50, 0}}, color = {0, 0, 0}),
    Text(extent = {{-80, -15}, {80, 15}}, textString = "%name", lineColor = {0, 0, 255}, origin = {75, 0}, rotation = -90),
    Polygon(points = {{15, 0}, {-15, 10}, {-15, -10}, {15, 0}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, origin = {0, -70}, rotation = -90)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end DutyResistorParam;
