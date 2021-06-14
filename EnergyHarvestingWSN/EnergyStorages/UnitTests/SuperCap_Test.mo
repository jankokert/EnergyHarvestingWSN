within EnergyHarvestingWSN.EnergyStorages.UnitTests;

model SuperCap_Test
  extends Modelica.Icons.Example;
  import SI = Modelica.SIunits;

  parameter SI.Time tcharge = 50 "charge duration";
  parameter SI.Time tdischarge = 50 "discharge duration";
  
  EnergyHarvestingWSN.EnergyStorages.SuperCap superCap(capParam = EnergyHarvestingWSN.Records.SuperCaps.CapXX_0F4(), vInit = 0) annotation(
    Placement(visible = true, transformation(extent = {{-30, 0}, {-10, 20}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.CCCV cccv1(Vmax=5, Imax=0.1, T=1E-4) annotation(
    Placement(visible = true, transformation(extent = {{-90, 0}, {-70, 20}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.VariableConductor variableConductor1 annotation(
    Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.VariableConductor variableConductor2 annotation(
    Placement(visible = true, transformation(origin = {10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.CCCV cccv2(Imax = 0.1, T = 1E-4, Vmax = 0)  annotation(
    Placement(visible = true, transformation(origin = {40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));

equation
  connect(cccv2.p, ground1.p) annotation(
    Line(points = {{40, 0}, {40, 0}, {40, -10}, {-20, -10}, {-20, -20}, {-20, -20}}, color = {0, 0, 255}));
  connect(variableConductor2.n, cccv2.n) annotation(
    Line(points = {{20, 40}, {40, 40}, {40, 20}, {40, 20}, {40, 20}}, color = {0, 0, 255}));
  connect(variableConductor2.p, superCap.p) annotation(
    Line(points = {{0, 40}, {-20, 40}, {-20, 20}, {-20, 20}, {-20, 20}}, color = {0, 0, 255}));
  connect(cccv1.n, ground1.p) annotation(
    Line(points = {{-80, 0}, {-80, 0}, {-80, -10}, {-20, -10}, {-20, -20}, {-20, -20}}, color = {0, 0, 255}));
  connect(superCap.n, ground1.p) annotation(
    Line(points = {{-20, 0}, {-20, 0}, {-20, -20}, {-20, -20}}, color = {0, 0, 255}));
  connect(variableConductor1.p, cccv1.p) annotation(
    Line(points = {{-60, 40}, {-80, 40}, {-80, 20}, {-80, 20}}, color = {0, 0, 255}));
  connect(variableConductor1.n, superCap.p) annotation(
    Line(points = {{-40, 40}, {-20, 40}, {-20, 20}, {-20, 20}}, color = {0, 0, 255}));

  if time <= tcharge then
    // charging
    variableConductor1.G = 1000;
    variableConductor2.G = 0;
  elseif time > tcharge and time < tcharge + tdischarge then
    // discharging
    variableConductor1.G = 0;
    variableConductor2.G = 1000;
  else
    variableConductor1.G = 0;
    variableConductor2.G = 0;
  end if;
  
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}})));
end SuperCap_Test;
