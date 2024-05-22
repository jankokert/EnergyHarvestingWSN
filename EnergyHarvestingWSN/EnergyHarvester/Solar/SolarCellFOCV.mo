within EnergyHarvestingWSN.EnergyHarvester.Solar;

model SolarCellFOCV
  extends EnergyHarvestingWSN.Components.PartialSolar;
  import SI = Modelica.Units.SI;

  parameter Real k_FOCV = 0.8 "MPP fraction of the open-circuit voltage";
  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarCell solarCell(A = A, param = param)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarCell pilotCell(A = A, param = param)  annotation(
    Placement(visible = true, transformation(origin = {40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain fraction(k = k_FOCV)  annotation(
    Placement(visible = true, transformation(origin = {66, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vMPP annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  Pirr = irradiance * A;
  pilotCell.Vout = fraction.u;
  connect(irradiance, solarCell.irradiance) annotation(
    Line(points = {{-100, 0}, {-8, 0}}, color = {0, 0, 127}));
  connect(solarCell.n, n) annotation(
    Line(points = {{0, -10}, {0, -100}}, color = {0, 0, 255}));
  connect(pilotCell.n, n) annotation(
    Line(points = {{40, -40}, {40, -80}, {0, -80}, {0, -100}}, color = {0, 0, 255}));
  connect(solarCell.p, p) annotation(
    Line(points = {{0, 10}, {0, 100}}, color = {0, 0, 255}));
  connect(pilotCell.irradiance, irradiance) annotation(
    Line(points = {{31, -30}, {-50, -30}, {-50, 0}, {-100, 0}}, color = {0, 0, 127}));
  connect(fraction.y, vMPP) annotation(
    Line(points = {{72, 0}, {110, 0}}, color = {0, 0, 127}));

annotation(
    Icon(graphics = {Rectangle(origin = {35, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-35, 25}, {35, -25}}), Text(origin = {33, 0}, extent = {{-42, 17}, {42, -17}}, textString = "V   ·k", fontName = "Arial", textStyle = {TextStyle.Italic}), Text(origin = {31, -6}, extent = {{-27, 2}, {27, -2}}, textString = "OC", fontName = "Arial")}),
    Diagram(graphics = {Line(origin = {40, 0}, points = {{18, 0}, {0, 0}, {0, -15}}, color = {0, 0, 127})}));
end SolarCellFOCV;
