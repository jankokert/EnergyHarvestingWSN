within EnergyHarvestingWSN.EnergyStorages.UnitTests;
model RCdischarge2
  extends Modelica.Icons.Example;
  import SI = Modelica.SIunits;
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.TafelSlope tafelSlope annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  EnergyHarvestingWSN.Utilities.Diffusion diffusion1 annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  EnergyHarvestingWSN.Utilities.VarCap varCap3(C0 = 17, Cv = 5, v(fixed = true, start = 1.3))  annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Utilities.VarCap varCap1 annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Diffusion diffusion2(v0 = 1.31)  annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  EnergyHarvestingWSN.Utilities.VarCap varCap2(C0 = 17, Cv = 5, v(fixed = true, start = 2.7))  annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(varCap2.p, diffusion1.p) annotation(
    Line(points = {{-70, -20}, {-70, -20}, {-70, -12}, {-30, -12}, {-30, -20}, {-30, -20}}, color = {0, 0, 255}));
  connect(varCap2.n, ground2.p) annotation(
    Line(points = {{-70, -40}, {-70, -40}, {-70, -52}, {-50, -52}, {-50, -60}, {-50, -60}}, color = {0, 0, 255}));
  connect(varCap3.p, diffusion2.p) annotation(
    Line(points = {{30, 60}, {30, 60}, {30, 70}, {70, 70}, {70, 60}, {70, 60}}, color = {0, 0, 255}));
  connect(diffusion2.n, ground3.p) annotation(
    Line(points = {{70, 40}, {70, 40}, {70, 30}, {50, 30}, {50, 20}, {50, 20}}, color = {0, 0, 255}));
  connect(varCap1.n, ground1.p) annotation(
    Line(points = {{-70, 40}, {-70, 40}, {-70, 30}, {-50, 30}, {-50, 20}, {-50, 20}}, color = {0, 0, 255}));
  connect(varCap1.p, tafelSlope.p) annotation(
    Line(points = {{-70, 60}, {-70, 60}, {-70, 70}, {-30, 70}, {-30, 60}, {-30, 60}}, color = {0, 0, 255}));
  connect(varCap3.n, ground3.p) annotation(
    Line(points = {{30, 40}, {30, 40}, {30, 30}, {50, 30}, {50, 20}, {50, 20}}, color = {0, 0, 255}));
  connect(tafelSlope.n, ground1.p) annotation(
    Line(points = {{-30, 40}, {-30, 40}, {-30, 30}, {-50, 30}, {-50, 20}, {-50, 20}}, color = {0, 0, 255}));
  connect(diffusion1.n, ground2.p) annotation(
    Line(points = {{-30, -40}, {-30, -40}, {-30, -52}, {-50, -52}, {-50, -60}, {-50, -60}}, color = {0, 0, 255}));
  annotation(
    experiment(StartTime = 1, StopTime = 3.2e+07, Tolerance = 1e-06, Interval = 1000));
end RCdischarge2;
