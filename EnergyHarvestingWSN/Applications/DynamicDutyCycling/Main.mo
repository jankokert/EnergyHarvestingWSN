within EnergyHarvestingWSN.Applications.DynamicDutyCycling;

model Main
  extends Modelica.Icons.Example;
  import APP = EnergyHarvestingWSN.Applications.DynamicDutyCycling;
  EnergyHarvestingWSN.Applications.DynamicDutyCycling.PowerManagement powerMgnt annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Applications.DynamicDutyCycling.EnergyControl energyControl annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarModule solarModule(A = 0.0001, param = EnergyHarvestingWSN.Records.SolarCells.StandardSi(), np = 1, ns = 8) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyLoads.WSNloads wsnloads(useExternalPeriods = true, loadCase = APP.TwoSimpleLoads()) annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Environment.StandardDay standardDay1 annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(standardDay1.irr, solarModule.irradiance) annotation(
    Line(points = {{-68, 0}, {-54, 0}, {-54, 0}, {-52, 0}}, color = {0, 0, 127}));
  connect(ground3.p, wsnloads.n) annotation(
    Line(points = {{70, -20}, {70, -20}, {70, -10}, {70, -10}}, color = {0, 0, 255}));
  connect(ground2.p, powerMgnt.n) annotation(
    Line(points = {{10, -20}, {10, -20}, {10, -10}, {10, -10}}, color = {0, 0, 255}));
  connect(ground1.p, solarModule.n) annotation(
    Line(points = {{-40, -20}, {-40, -20}, {-40, -14}, {-40, -14}}, color = {0, 0, 255}));
  connect(energyControl.loadInfo, wsnloads.loadInfo) annotation(
    Line(points = {{20, 50}, {48, 50}, {48, 50}, {76, 50}, {76, 10}, {76, 10}, {76, 10}, {76, 10}}, color = {255, 0, 0}, thickness = 0.5));
  connect(powerMgnt.pout, wsnloads.p) annotation(
    Line(points = {{20, 6}, {25, 6}, {25, 6}, {30, 6}, {30, 20}, {70, 20}, {70, 10}}, color = {0, 0, 255}));
  connect(solarModule.p, powerMgnt.pin) annotation(
    Line(points = {{-40, 14}, {-40, 20}, {-12, 20}, {-12, 6}, {0, 6}}, color = {0, 0, 255}));
  connect(powerMgnt.energyInfo, energyControl.energyInfo) annotation(
    Line(points = {{10, 10}, {10, 10}, {10, 10}, {10, 10}, {10, 40}, {10, 40}, {10, 40}, {10, 40}}, color = {255, 204, 51}, thickness = 0.5));
  annotation(
    experiment(StartTime = 0, StopTime = 300000, Tolerance = 1e-06, Interval = 600),
    Diagram(graphics = {Text(origin = {-60, -40}, extent = {{-16, 6}, {24, -6}}, textString = "energy source"), Text(origin = {66, -42}, extent = {{-16, 6}, {24, -6}}, textString = "energy sink
(application)"), Text(origin = {56, 54}, textColor = {255, 0, 0}, extent = {{-16, 6}, {24, -6}}, textString = "control and state"), Text(origin = {28, 30}, textColor = {255, 170, 0}, extent = {{-16, 6}, {24, -6}}, textString = "energy
info", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(initialScale = 0.1)));
end Main;
