within EnergyHarvestingWSN.EnergyStorages.UnitTests;
model Battery_Test
  extends Modelica.Icons.Example;
  
  EnergyHarvestingWSN.EnergyStorages.Battery batt1( SOCini= 1.0,cellParam = EnergyHarvestingWSN.Records.Batteries.CR2032_Panasonic()) annotation(
    Placement(visible=true, transformation(origin = {-50,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyLoads.MicroController microController(mcparam = EnergyHarvestingWSN.Records.MicroControllers.MSP430()) annotation(Placement(transformation(extent = {{0, -10}, {20, 10}})));
  Modelica.Blocks.Sources.Constant frequencyMHz(k = 8) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {-20, -4})));
  EnergyHarvestingWSN.Control.TerminateSim terminateSim annotation(Placement(transformation(extent = {{40, -10}, {60, 10}})));
  Modelica.Blocks.Logical.Not not1 annotation(Placement(transformation(extent = {{26, -4}, {34, 4}})));
  EnergyHarvestingWSN.Control.DutyCycleAvg dutyCycleAvg(activeTime = extern, periode = 100) annotation(Placement(transformation(extent = {{-40, 60}, {-20, 80}})));
  parameter Real extern = 1;
  
equation
  connect(ground1.p, batt1.n) annotation(Line(points = {{-50, -30}, {-50, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(microController.n, batt1.n) annotation(Line(points = {{10, -10}, {10, -20}, {-50, -20}, {-50, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(batt1.p, microController.p) annotation(Line(points = {{-50, 10}, {-50, 20}, {10, 20}, {10, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(frequencyMHz.y, microController.frequency) annotation(Line(points = {{-13.4, -4}, {-1, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(not1.y, terminateSim.u) annotation(Line(points = {{34.4, 0}, {39, 0}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(microController.isOpSafely, not1.u) annotation(Line(points = {{21, 0}, {25.2, 0}}, color = {255, 0, 255}, smooth = Smooth.None));
  connect(dutyCycleAvg.y, microController.dutyCycle) annotation(Line(points = {{-19, 70}, {-8, 70}, {-8, 4}, {-1, 4}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Documentation(info = "info"), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    experiment(StartTime = 0, StopTime = 3E8, Tolerance = 1e-6, Interval = 600000));
end Battery_Test;
