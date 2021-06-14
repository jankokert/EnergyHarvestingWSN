within EnergyHarvestingWSN.PowerConverter.UnitTests;

model LDO_Test
  extends Modelica.Icons.Example;
  
  EnergyHarvestingWSN.Utilities.Ground gnd annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.Ideal_LDO myLDO(VoutSet = 3.3) annotation(
    Placement(visible = true, transformation(extent = {{-10, 32}, {10, 52}}, rotation = 0)));
  //EnergyHarvestingWSN.PowerConverter.LDO myLDO(param = EnergyHarvestingWSN.Records.LDOs.MCP1700_3V3()) annotation(
  //  Placement(visible = true, transformation(extent = {{-10, 32}, {10, 52}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.RampVoltage inputVoltage(V = -10, duration = 10, offset = 12) annotation(
    Placement(visible = true, transformation(origin = {-40, 18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  EnergyHarvestingWSN.EnergyLoads.PeriodicCurrent task(offCurrent = 0.0, onCurrent = 1, useExternalPeriod = true)  annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  task.period = 3;

  connect(task.n, gnd.p) annotation(
    Line(points = {{50, 0}, {50, 0}, {50, -12}, {-40, -12}, {-40, -20}, {-40, -20}}, color = {0, 0, 255}));
  connect(myLDO.pout, task.p) annotation(
    Line(points = {{10, 48}, {50, 48}, {50, 20}, {50, 20}}, color = {0, 0, 255}));
  connect(myLDO.pin, inputVoltage.p) annotation(
    Line(points = {{-10, 48}, {-30, 48}, {-40, 48}, {-40, 28}}, color = {0, 0, 255}));
  connect(inputVoltage.n, gnd.p) annotation(
    Line(points = {{-40, 8}, {-40, -20}}, color = {0, 0, 255}));
  connect(myLDO.n, gnd.p) annotation(
    Line(points = {{0, 32}, {0, -12}, {-40, -12}, {-40, -20}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.02));
end LDO_Test;
