within EnergyHarvestingWSN.PowerConverter.UnitTests;

model SolarADP5090
  extends Modelica.Icons.Example;
  import SI = Modelica.Units.SI;
  
  EnergyHarvestingWSN.Environment.StandardDay stdDay(cloudChange = 15, cloudiness = 1.2, timeOffset(displayUnit = "s")) annotation(
    Placement(visible = true, transformation(extent = {{-80, -10}, {-60, 10}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarCellFOCV solarCell(A = 0.001, param = EnergyHarvestingWSN.Records.SolarCells.StandardSi()) annotation(
    Placement(visible = true, transformation(extent = {{-40, -10}, {-20, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.DCDC dcdc(TFB = 1E-4, Voutset = 4.2, fixedMPP = 0.5, kFB = 1E-4, param = EnergyHarvestingWSN.Records.DCDC.ADP5090(), useExternalMPP = true) annotation(
    Placement(transformation(extent = {{0, 4}, {20, 24}})));
  EnergyHarvestingWSN.EnergyStorages.Battery battery(SOCini = 0.1, cellParam = EnergyHarvestingWSN.Records.Batteries.LiPo50mA()) annotation(
    Placement(visible = true, transformation(extent = {{30, -8}, {50, 12}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground1 annotation(
    Placement(visible = true, transformation(extent = {{-40, -36}, {-20, -16}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground2 annotation(
    Placement(visible = true, transformation(extent = {{0, -36}, {20, -16}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground3 annotation(
    Placement(visible = true, transformation(extent = {{30, -36}, {50, -16}}, rotation = 0)));
  
  parameter Real EffAvgSolar = 0.18;
  parameter Real EffAvgDCDC = 0.70;
  SI.Energy Eirr, Eharv, Estore, Eharv_approx, Estore_approx;

equation
  der(Eirr) = solarCell.Pirr;
  der(Eharv) = dcdc.PWRin;
  der(Estore) = dcdc.PWRout;
  der(Eharv_approx) = EffAvgSolar * solarCell.Pirr;  
  der(Estore_approx) = EffAvgSolar * EffAvgDCDC * solarCell.Pirr;  // peak efficiency of 18% * 80% of dcdc


  connect(stdDay.irr, solarCell.irradiance) annotation(
    Line(points = {{-58, 0}, {-38, 0}}, color = {0, 0, 127}));
  connect(dcdc.pin, solarCell.p) annotation(
    Line(points = {{0, 20}, {-30, 20}, {-30, 10}}, color = {0, 0, 255}));
  connect(dcdc.pout, battery.p) annotation(
    Line(points = {{20, 20}, {40, 20}, {40, 12}}, color = {0, 0, 255}));
  connect(solarCell.vMPP, dcdc.extMPP) annotation(
    Line(points = {{-22, 0}, {-16, 0}, {-16, 14}, {0, 14}}, color = {0, 0, 127}));
  connect(solarCell.n, ground1.p) annotation(
    Line(points = {{-30, -10}, {-30, -16}}, color = {0, 0, 255}));
  connect(dcdc.n, ground2.p) annotation(
    Line(points = {{10, 4}, {10, -16}}, color = {0, 0, 255}));
  connect(battery.n, ground3.p) annotation(
    Line(points = {{40, -8}, {40, -16}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {-8, 12}, lineThickness = 1, extent = {{-8, 1.5}, {8, -2}}, textString = "Vmpp", fontName = "Arial"), Text(origin = {-50, 2}, lineThickness = 1, extent = {{-9, 1.5}, {9, -2}}, textString = "irradiance", fontName = "Arial")}),
    experiment(StartTime = 18000, StopTime = 70000, Tolerance = 1e-06, Interval = 100));
end SolarADP5090;
