within EnergyHarvestingWSN.PowerConverter;
model DCDC
  extends EnergyHarvestingWSN.Interfaces.ThreePin;
  extends EnergyHarvestingWSN.Icons.DCDC;
  extends EnergyHarvestingWSN.Interfaces.ConditionalMPPpin;
  import SI = Modelica.Units.SI;
  
  parameter Real kFB(min = Modelica.Constants.small) = 0.1 "Gain";
  parameter SI.Time TFB(min = Modelica.Constants.small) = 0.1 "Time constant";
  parameter SI.Voltage Voutset(start = 0) "Settable output voltage";
  parameter SI.Current Ioutset(start = 0) "Settable output current";
  parameter EnergyHarvestingWSN.Records.DCDC.template param annotation(
    choicesAllMatching = true,
    Placement(visible = true, transformation(origin = {-21, 57}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  
  SI.Power PWRout, PWRin;
  SI.Efficiency effCalc;
  inner Boolean isOn;
  inner SI.Voltage Vset;
  inner SI.Current Iset;
  
  EnergyHarvestingWSN.Utilities.VariableConductorPlossOut Gin(Gmax = param.Gmax)  annotation(
    Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Sources.SignalCurrent Iout_src(i(start = 0)) annotation(
    Placement(visible = true, transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  EnergyHarvestingWSN.PowerConverter.Components.Feedback feedback(final param = param) annotation(
    Placement(visible = true, transformation(extent = {{-30, 20}, {-10, 40}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.PI_Controller controller(T = TFB, k = kFB) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.Components.StartStop startStop(param = param) annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.Components.Efficiency efficiency(param = param) annotation(
    Placement(visible = true, transformation(origin = {-20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.Components.OutputCalc currentOut(param = param) annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  PWRout = Vout * Iout;
  PWRin = Vin * Iin;
  
  // +1E-10 is needed if converter is forced to switch off
  effCalc = if PWRin > 1E-6 and PWRout > 1E-6 then PWRout/(PWRin + 1E-10) else 0;

  if isOn then
    assert(Vin >= Vmpp, "Vin < Vmpp. Please choose Vmpp correctly!", AssertionLevel.warning);
  end if;
  
  // check if param Voutset or Ioutset is provided. If not, get the values from the record
  Vset = if Voutset > 0 then min(Voutset, param.Vsetmax) else param.Vsetmax;
  Iset = if Ioutset > 0 then min(Ioutset, param.Isetmax) else param.Isetmax;

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
  connect(Gin.Ploss, efficiency.pin) annotation(
    Line(points = {{-52, -41}, {-52, -50}, {-32, -50}}, color = {0, 0, 127}));
  connect(pout, Iout_src.n) annotation(
    Line(points = {{100, 60}, {70, 60}, {70, -40}, {70, -40}}, color = {0, 0, 255}));

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1), graphics = {Line(origin = {-70, -30}, points = {{0, -20}, {0, 20}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Text(origin = {-75, -29}, textColor = {0, 136, 0}, extent = {{-7, -3}, {7, 3}}, textString = "Vin", fontSize = 12), Text(origin = {9, 33}, textColor = {0, 0, 127}, extent = {{-10, -2}, {10, 2.5}}, textString = "feedback", horizontalAlignment = TextAlignment.Left), Text(origin = {16, -7}, textColor = {0, 0, 127}, extent = {{-10, -2}, {10, 2.5}}, textString = "Gcontrol", horizontalAlignment = TextAlignment.Left), Text(origin = {87, -51}, textColor = {0, 136, 0}, extent = {{-7, -3}, {7, 3}}, textString = "Vout", fontSize = 12), Line(origin = {80, -50}, points = {{0, -20}, {0, 20}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Line(origin = {69.2961, 47.1386}, points = {{-2, 17}, {16, 17}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Text(origin = {75, 69}, textColor = {0, 136, 0}, extent = {{-7, -3}, {7, 3}}, textString = "Iout", fontSize = 12), Text(origin = {-83, 69}, textColor = {0, 136, 0}, extent = {{-7, -3}, {7, 3}}, textString = "Iin", fontSize = 12), Line(origin = {-88.4727, 47.1386}, points = {{-2, 17}, {16, 17}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Text(origin = {-38, -47}, textColor = {0, 0, 127}, extent = {{-4, -2}, {4, 2.5}}, textString = "Pin", horizontalAlignment = TextAlignment.Left), Text(origin = {10, -47}, textColor = {0, 0, 127}, extent = {{-4, -2}, {4, 2.5}}, textString = "Pout", horizontalAlignment = TextAlignment.Left), Text(origin = {21, -92}, textColor = {0, 0, 255}, extent = {{-12, -2.8}, {12, 2.8}}, textString = "(ground)", horizontalAlignment = TextAlignment.Left), Line(origin = {-75, 0}, points = {{-25, 0}, {0, 0}, {0, 44}, {50, 44}}, color = {0, 0, 127}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {-83, 5}, textColor = {0, 0, 127}, extent = {{-7, -3}, {7, 3}}, textString = "Vmpp", fontSize = 12)}),
    Icon(coordinateSystem(initialScale = 0.1, extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false)));
end DCDC;
