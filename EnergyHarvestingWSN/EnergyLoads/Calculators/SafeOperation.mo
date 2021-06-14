within EnergyHarvestingWSN.EnergyLoads.Calculators;


block SafeOperation
  extends EnergyHarvestingWSN.Icons.Block;
  parameter Real saveOpTable[:, 2] = fill(0, 0, 2)
    "Vdd in V = first column, Operation frequency in MHz = second column";
  Modelica.Blocks.Interfaces.RealInput Vdd "Operation voltage in V" annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
  Modelica.Blocks.Interfaces.RealInput f "Operation frequency in MHz" annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-110, -40})));
  Modelica.Blocks.Interfaces.BooleanOutput y annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
  Modelica.Blocks.Tables.CombiTable1D interpolate(final table = saveOpTable) annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Greater greater annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));
equation
  connect(interpolate.u[1], Vdd) annotation(Line(points = {{-62, 0}, {-110, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(greater.u1, interpolate.y[1]) annotation(Line(points = {{-12, 0}, {-39, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(greater.u2, f) annotation(Line(points = {{-12, -8}, {-20, -8}, {-20, -40}, {-110, -40}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(greater.y, y) annotation(Line(points = {{11, 0}, {110, 0}}, color = {255, 0, 255}, smooth = Smooth.None));

  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-74, 30}, {74, -32}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "Safe Op.")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end SafeOperation;
