within EnergyHarvestingWSN.PowerConverter.UnitTests;
model DCDC_LT_batt_charge
  extends Modelica.Icons.Example;
  
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {40,-10}, extent = {{-10.0,-10.0},{10.0,10.0}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.RampVoltage inputVoltage(V = 9, offset = 1, duration = 100) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin={-40,20})));
  EnergyHarvestingWSN.EnergyStorages.Battery battery(cellParam=EnergyHarvestingWSN.Records.Batteries.WBLYP40(), SOCini = 0.1) annotation(
    Placement(transformation(extent={{30,12},{50,32}})));
  EnergyHarvestingWSN.PowerConverter.DCDC LT3652(Voutset = 3.6, param = EnergyHarvestingWSN.Records.DCDC.LT3652()) annotation(
    Placement(transformation(extent={{-20,30},{0,50}})));
  EnergyHarvestingWSN.Utilities.Resistor wires(R=0.02) annotation(
    Placement(transformation(extent={{10,36},{30,56}})));
equation
  connect(battery.n, ground.p) annotation(
    Line(points = {{40, 12}, {40, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(LT3652.n, ground.p) annotation(
    Line(points = {{-10, 30}, {-10, 0}, {40, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(inputVoltage.n, ground.p) annotation(
    Line(points = {{-40, 10}, {-40, 0}, {40, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(LT3652.pin, inputVoltage.p) annotation(
    Line(points = {{-20, 46}, {-40, 46}, {-40, 30}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(wires.p, LT3652.pout) annotation(
    Line(points = {{10, 46}, {0, 46}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(wires.n, battery.p) annotation(
    Line(points = {{30, 46}, {40, 46}, {40, 32}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 200000, Tolerance = 1e-06, Interval = 40));
end DCDC_LT_batt_charge;
