within EnergyHarvestingWSN.PowerConverter;
model DCDC
  extends EnergyHarvestingWSN.Interfaces.PartialPowerConverter;
  extends EnergyHarvestingWSN.Icons.DCDC;
  extends EnergyHarvestingWSN.Interfaces.ConditionalMPPpin;
  import SI = Modelica.Units.SI;

  parameter Real kFB(min = Modelica.Constants.small) = 0.1 "Gain";
  parameter SI.Time TFB(min = Modelica.Constants.small) = 0.1 "Time constant";
  parameter EnergyHarvestingWSN.Records.DCDC.template param annotation(
    Placement(visible = true, transformation(origin = {-21, 57}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));

  EnergyHarvestingWSN.Utilities.VariableConductor Gin annotation(
    Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Sources.SignalCurrent Iout_src(i(start=0)) annotation(
    Placement(visible = true, transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  EnergyHarvestingWSN.PowerConverter.Components.Feedback feedback(final param = param) annotation(
    Placement(visible = true, transformation(extent = {{-30, 20}, {-10, 40}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.PI_Controller controller(T = TFB, k = kFB) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.Components.StartStop startStop(param = param)  annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.Components.Efficiency efficiency(param = param)  annotation(
    Placement(visible = true, transformation(origin = {-20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.Components.OutputCalc currentOut(param = param)  annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  if isOn then
    assert(Vin >= Vmpp, "Vin < Vmpp. Please choose Vmpp correctly!", AssertionLevel.warning);
  end if;
  connect(feedback.fb, controller.u) annotation(
    Line(points = {{-9, 30}, {18, 30}}, color = {0, 0, 127}));
  connect(Gin.n, n) annotation(
    Line(points = {{-60, -40}, {-60, -80}, {0, -80}, {0, -100}}, color = {0, 0, 255}));
  connect(pin, Gin.p) annotation(
    Line(points = {{-100, 60}, {-60, 60}, {-60, -20}}, color = {0, 0, 255}));
  connect(startStop.gout, Gin.G) annotation(
    Line(points = {{-31, -10}, {-45, -10}, {-45, -30}, {-49, -30}}, color = {0, 0, 127}));
  connect(startStop.gin, controller.y) annotation(
    Line(points = {{-8, -10}, {50, -10}, {50, 30}, {41, 30}}, color = {0, 0, 127}));
  connect(efficiency.pout, currentOut.pout) annotation(
    Line(points = {{-9, -50}, {18, -50}}, color = {0, 0, 127}));
  connect(currentOut.iout, Iout_src.i) annotation(
    Line(points = {{41, -50}, {58, -50}}, color = {0, 0, 127}));
  connect(Iout_src.p, n) annotation(
    Line(points = {{70, -60}, {70, -60}, {70, -80}, {0, -80}, {0, -100}, {0, -100}}, color = {0, 0, 255}));
  connect(Gin.pin, efficiency.pin) annotation(
    Line(points = {{-52, -41}, {-52, -50}, {-32, -50}}, color = {0, 0, 127}));
  connect(pout, Iout_src.n) annotation(
    Line(points = {{100, 60}, {70, 60}, {70, -40}, {70, -40}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1), graphics = {Line(origin = {-70.1077, -30.5827}, points = {{0, 19}, {0, -21}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Text(origin = {-75, -29}, lineColor = {0, 136, 0}, extent = {{-7, -3}, {7, 3}}, textString = "Vin", fontSize = 12), Text(origin = {9, 33}, lineColor = {0, 0, 127}, extent = {{-10, -2}, {10, 2.5}}, textString = "feedback", horizontalAlignment = TextAlignment.Left), Text(origin = {16, -7}, lineColor = {0, 0, 127}, extent = {{-10, -2}, {10, 2.5}}, textString = "Gcontrol", horizontalAlignment = TextAlignment.Left), Text(origin = {87, -51}, lineColor = {0, 136, 0}, extent = {{-7, -3}, {7, 3}}, textString = "Vout", fontSize = 12), Line(origin = {79.7835, -41.5422}, points = {{0, 11}, {0, -29}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Line(origin = {69.2961, 47.1386}, points = {{-2, 17}, {16, 17}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Text(origin = {75, 69}, lineColor = {0, 136, 0}, extent = {{-7, -3}, {7, 3}}, textString = "Iout", fontSize = 12), Text(origin = {-83, 69}, lineColor = {0, 136, 0}, extent = {{-7, -3}, {7, 3}}, textString = "Iin", fontSize = 12), Line(origin = {-88.4727, 47.1386}, points = {{-2, 17}, {16, 17}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Text(origin = {-38, -47}, lineColor = {0, 0, 127}, extent = {{-4, -2}, {4, 2.5}}, textString = "Pin", horizontalAlignment = TextAlignment.Left), Text(origin = {10, -47}, lineColor = {0, 0, 127}, extent = {{-4, -2}, {4, 2.5}}, textString = "Pout", horizontalAlignment = TextAlignment.Left), Text(origin = {15, -93}, lineColor = {0, 136, 0}, extent = {{-7, -3}, {7, 3}}, textString = "GND", fontSize = 12), Line(origin = {-70, 0}, points = {{-30, 0}, {0, 0}, {0, 44}, {47, 44}}, color = {0, 170, 0}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {-83, 5}, lineColor = {0, 136, 0}, extent = {{-7, -3}, {7, 3}}, textString = "Vmpp", fontSize = 12)}),
    Icon(coordinateSystem(initialScale = 0.1)));
end DCDC;
