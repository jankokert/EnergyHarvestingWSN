within EnergyHarvestingWSN.Applications.SolarDisplay;

model SolarDisplayR
  extends Modelica.Icons.Example;
  import SI = Modelica.SIunits;/*Real intWork;
      Real workingFraction;
    */
  EnergyHarvestingWSN.Environment.SolarIrradiation solarIrradiation(colIrr = 10, fileName = "/Resources/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.txt") annotation(
    Placement(visible = true, transformation(extent = {{-90, -10}, {-70, 10}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarModuleFOCV solarModule(np = 1, A = 1E-2, param = EnergyHarvestingWSN.Records.SolarCells.StandardSi(), ns = 36) annotation(
    Placement(visible = true, transformation(extent = {{-50, -10}, {-30, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.DCDC dcdc(TFB = 0.0001, kFB = 0.0001, param = EnergyHarvestingWSN.Records.DCDC.LT3652(), useExternalMPP = true) annotation(
    Placement(transformation(extent = {{-10, 4}, {10, 24}})));
  Modelica.Electrical.Spice3.Basic.R_Resistor resistor(R = 10000000) annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  EnergyHarvestingWSN.Utilities.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
equation
/*
  if dCDCreg.isWorking then
    der(intWork) = 1;
  else
    der(intWork) = 0;
  end if;
  if time>1 then
    workingFraction = intWork/time;
  else
    workingFraction = 0;
  end if;
  */
  connect(resistor.n, ground3.p) annotation(
    Line(points = {{40, -10}, {40, -10}, {40, -20}, {40, -20}}, color = {0, 0, 255}));
  connect(dcdc.pout, resistor.p) annotation(
    Line(points = {{10, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
  connect(dcdc.n, ground2.p) annotation(
    Line(points = {{0, 4}, {0, 4}, {0, -20}, {0, -20}}, color = {0, 0, 255}));
  connect(solarModule.n, ground1.p) annotation(
    Line(points = {{-40, -10}, {-40, -10}, {-40, -20}, {-40, -20}}, color = {0, 0, 255}));
  connect(solarModule.irradiance, solarIrradiation.irrOutput) annotation(
    Line(points = {{-49, 0}, {-68, 0}}, color = {0, 0, 127}));
  connect(dcdc.pin, solarModule.p) annotation(
    Line(points = {{-10, 20}, {-40, 20}, {-40, 10}, {-40, 10}}, color = {0, 0, 255}));
  connect(solarModule.vMPP, dcdc.extMPP) annotation(
    Line(points = {{-32, 0}, {-20, 0}, {-20, 14}, {-10, 14}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 1.728));
end SolarDisplayR;
