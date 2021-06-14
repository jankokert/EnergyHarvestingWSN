within EnergyHarvestingWSN.EnergyLoads;
model DutyCurrent

  Modelica.Electrical.Analog.Sources.SignalCurrent current annotation(
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {0, 0})));
  Modelica.Electrical.Analog.Interfaces.PositivePin vdd annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin gnd annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput dutyCycle annotation(
    Placement(transformation(extent = {{-120, 30}, {-100, 50}}), iconTransformation(extent = {{-70, 50}, {-50, 70}})));
  Modelica.Blocks.Interfaces.RealInput activeCurrent annotation(
    Placement(transformation(extent = {{-120, -10}, {-100, 10}}), iconTransformation(extent = {{-70, -10}, {-50, 10}})));
  Modelica.Blocks.Interfaces.RealInput sleepCurrent annotation(
    Placement(transformation(extent = {{-120, -50}, {-100, -30}}), iconTransformation(extent = {{-70, -50}, {-50, -30}})));

equation
  current.i = dutyCycle * activeCurrent + (1 - dutyCycle) * sleepCurrent;
  connect(vdd, current.p) annotation(
    Line(points = {{0, 100}, {0, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(current.n, gnd) annotation(
    Line(points = {{0, -10}, {0, -100}}, color = {0, 0, 255}, smooth = Smooth.None));

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics={
    Line(points = {{-50, 60}, {-40, 60}, {-20, 40}}, color = {0, 0, 255}, smooth = Smooth.None),
    Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid),
    Line(points = {{0, 90}, {0, 50}}, color = {0, 0, 0}),
    Line(points = {{0, -50}, {0, -90}}, color = {0, 0, 0}),
    Line(points = {{50, 0}, {-50, 0}}, color = {0, 0, 0}),
    Text(extent = {{-80, -15}, {80, 15}}, textString = "%name", lineColor = {0, 0, 255}, origin = {75, 0}, rotation = -90),
    Polygon(points = {{15, 0}, {-15, 10}, {-15, -10}, {15, 0}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, origin = {0, -70}, rotation = -90),
    Text(extent = {{-40, 80}, {-20, 60}}, lineColor = {0, 0, 255}, textString = "d")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end DutyCurrent;
