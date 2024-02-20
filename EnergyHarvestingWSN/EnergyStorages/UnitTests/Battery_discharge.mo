within EnergyHarvestingWSN.EnergyStorages.UnitTests;

model Battery_discharge
  extends Modelica.Icons.Example;  
  import SI = Modelica.Units.SI;  
  EnergyHarvestingWSN.Utilities.Ground ground annotation(
    Placement(visible = true, transformation(origin = {0, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyStorages.Battery battery(cellParam = EnergyHarvestingWSN.Records.Batteries.WBLYP40(), SOCini = 1) annotation(
    Placement(transformation(extent = {{-10, 12}, {10, 32}})));
  Modelica.Electrical.Analog.Sources.SignalCurrent load annotation(
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {40, 20})));
  Real Idis(start = 1) "Charge Stop (SOC)";
  parameter SI.Voltage Vend = 0 "End-of-discharge voltage" annotation(
    Dialog(group = "Initialization"));
  
  
algorithm
  when battery.Vout < Vend then
    Idis := 0;
  end when;
  
equation
  load.i = pre(Idis);
  connect(battery.n, ground.p) annotation(
    Line(points = {{0, 12}, {0, -6}}, color = {0, 0, 255}));
  connect(battery.p, load.p) annotation(
    Line(points = {{0, 32}, {0, 40}, {40, 40}, {40, 30}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(load.n, ground.p) annotation(
    Line(points = {{40, 10}, {40, 0}, {0, 0}, {0, -6}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 200000, Tolerance = 1e-6, Interval = 400));
end Battery_discharge;
