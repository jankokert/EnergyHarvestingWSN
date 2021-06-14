within EnergyHarvestingWSN.EnergyLoads;
model WSNloads
  extends EnergyHarvestingWSN.Components.PartialLoad;
  import SI = Modelica.Units.SI;

  EnergyHarvestingWSN.EnergyLoads.PeriodicCurrent task1(delay = loadCase.delays[1], offCurrent = loadCase.offCurrents[1], onCurrent = loadCase.onCurrents[1], onTime = loadCase.onTimes[1], useExternalPeriod = true) annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyLoads.PeriodicCurrent task2(delay = loadCase.delays[2], offCurrent = loadCase.offCurrents[2], onCurrent = loadCase.onCurrents[2], onTime = loadCase.onTimes[2], useExternalPeriod = true) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  if useExternalPeriods then
    task1.period = loadInfo.periods[1];
  else
    task1.period = loadCase.periods[1];
  end if;
  if useExternalPeriods then
    task2.period = loadInfo.periods[2];
  else
    task2.period = loadCase.periods[2];
  end if;

  connect(task2.isOn, loadInfo.taskIsOn[2]) annotation(
    Line(points = {{42, 0}, {60, 0}, {60, 90}}, color = {255, 0, 255}));
  connect(task1.isOn, loadInfo.taskIsOn[1]) annotation(
    Line(points = {{-19, 0}, {-12, 0}, {-12, 20}, {60, 20}, {60, 90}}, color = {255, 0, 255}));
  connect(task1.n, n) annotation(
    Line(points = {{-30, -10}, {-30, -40}, {0, -40}, {0, -100}}, color = {0, 0, 255}));
  connect(task1.p, p) annotation(
    Line(points = {{-30, 10}, {-30, 40}, {0, 40}, {0, 100}}, color = {0, 0, 255}));
  connect(task2.n, n) annotation(
    Line(points = {{30, -10}, {30, -10}, {30, -40}, {0, -40}, {0, -100}, {0, -100}}, color = {0, 0, 255}));
  connect(task2.p, p) annotation(
    Line(points = {{30, 10}, {30, 40}, {0, 40}, {0, 100}}, color = {0, 0, 255}));

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1)),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end WSNloads;
