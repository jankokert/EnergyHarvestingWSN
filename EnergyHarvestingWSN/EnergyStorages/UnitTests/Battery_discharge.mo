within EnergyHarvestingWSN.EnergyStorages.UnitTests;

model Battery_discharge
  extends Modelica.Icons.Example;
  EnergyHarvestingWSN.Utilities.Ground ground annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  EnergyStorages.Battery2 battery(cellParam = EnergyHarvestingWSN.Records.Batteries.WBLYP40(), SOCini = 1) annotation(
    Placement(transformation(extent = {{-10, 12}, {10, 32}})));
  Modelica.Electrical.Analog.Sources.SignalCurrent load annotation(
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {40, 20})));
  Real Idis(start = 1) "Charge Stop (SOC)";
algorithm
  when battery.v < 3.06 then
    Idis := 0;
  end when;
equation
  load.i = min(time / 10, pre(Idis));
  connect(battery.n, ground.p) annotation(
    Line(points = {{0, 12}, {0, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(battery.p, load.p) annotation(
    Line(points = {{0, 32}, {0, 40}, {40, 40}, {40, 30}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(load.n, ground.p) annotation(
    Line(points = {{40, 10}, {40, 0}, {0, 0}, {0, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Battery_discharge;
