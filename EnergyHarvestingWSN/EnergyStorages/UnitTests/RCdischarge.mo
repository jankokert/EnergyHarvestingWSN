within EnergyHarvestingWSN.EnergyStorages.UnitTests;

model RCdischarge
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.TafelSlope tafelSlope2 annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  EnergyHarvestingWSN.Utilities.VarCap varCap2(C0 = 17, Cv = 5, v(fixed = true, start = 2.7))  annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Resistor resistor2(R = 4.7E6)  annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent2(I = 120E-9)  annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent1(I = 120E-9)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.TafelSlope tafelSlope1 annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  EnergyHarvestingWSN.Utilities.Resistor resistor1(R = 4.7E6)  annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  EnergyHarvestingWSN.Utilities.VarCap varCap1(C0 = 17, Cv = 5, v(fixed = true, start = 1.3))  annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(resistor1.n, ground1.p) annotation(
    Line(points = {{70, 40}, {70, 40}, {70, 30}, {10, 30}, {10, 20}, {10, 20}}, color = {0, 0, 255}));
  connect(tafelSlope1.n, ground1.p) annotation(
    Line(points = {{30, 40}, {30, 40}, {30, 30}, {10, 30}, {10, 20}, {10, 20}}, color = {0, 0, 255}));
  connect(varCap1.n, ground1.p) annotation(
    Line(points = {{-10, 40}, {-10, 40}, {-10, 30}, {10, 30}, {10, 20}, {10, 20}}, color = {0, 0, 255}));
  connect(constantCurrent1.p, ground1.p) annotation(
    Line(points = {{-50, 40}, {-50, 40}, {-50, 30}, {10, 30}, {10, 20}, {10, 20}}, color = {0, 0, 255}));
  connect(tafelSlope1.p, resistor1.p) annotation(
    Line(points = {{30, 60}, {30, 60}, {30, 70}, {70, 70}, {70, 60}, {70, 60}}, color = {0, 0, 255}));
  connect(varCap1.p, tafelSlope1.p) annotation(
    Line(points = {{-10, 60}, {-10, 60}, {-10, 70}, {30, 70}, {30, 60}, {30, 60}}, color = {0, 0, 255}));
  connect(constantCurrent1.n, varCap1.p) annotation(
    Line(points = {{-50, 60}, {-50, 60}, {-50, 70}, {-10, 70}, {-10, 60}, {-10, 60}}, color = {0, 0, 255}));
  connect(resistor2.n, ground2.p) annotation(
    Line(points = {{70, -40}, {70, -40}, {70, -52}, {10, -52}, {10, -60}, {10, -60}}, color = {0, 0, 255}));
  connect(tafelSlope2.n, ground2.p) annotation(
    Line(points = {{30, -40}, {30, -40}, {30, -52}, {10, -52}, {10, -60}, {10, -60}}, color = {0, 0, 255}));
  connect(varCap2.n, ground2.p) annotation(
    Line(points = {{-10, -40}, {-10, -40}, {-10, -52}, {10, -52}, {10, -60}, {10, -60}}, color = {0, 0, 255}));
  connect(constantCurrent2.p, ground2.p) annotation(
    Line(points = {{-50, -40}, {-50, -52}, {10, -52}, {10, -60}}, color = {0, 0, 255}));
  connect(constantCurrent2.n, varCap2.p) annotation(
    Line(points = {{-50, -20}, {-50, -20}, {-50, -10}, {-10, -10}, {-10, -20}, {-10, -20}}, color = {0, 0, 255}));
  connect(tafelSlope2.p, resistor2.p) annotation(
    Line(points = {{30, -20}, {30, -20}, {30, -10}, {70, -10}, {70, -20}, {70, -20}}, color = {0, 0, 255}));
  connect(tafelSlope2.p, varCap2.p) annotation(
    Line(points = {{30, -20}, {30, -20}, {30, -10}, {-10, -10}, {-10, -20}, {-10, -20}}, color = {0, 0, 255}));
  annotation(
    experiment(StartTime = 1, StopTime = 3.2e+07, Tolerance = 1e-06, Interval = 1000));
end RCdischarge;
