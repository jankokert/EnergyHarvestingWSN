within EnergyHarvestingWSN.EnergyStorages;

model Battery "Battery cell model with a static internal impedance and self discharge"
  extends EnergyHarvestingWSN.Interfaces.TwoPin;
  extends EnergyHarvestingWSN.Icons.Battery;
  
  import SI = Modelica.Units.SI;
  parameter EnergyHarvestingWSN.Records.Batteries.template cellParam annotation(
    choicesAllMatching = true,
    Placement(visible = true, transformation(origin = {-80, 84}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  parameter Real SOCini = 1 "Initial state of charge" annotation(
    Dialog(group = "Initialization"));

  SI.Current Iout "Current flowing out of the battery";
  Boolean isCriticalCharging;
  parameter SI.Current Iselfdis = cellParam.ksdyr * cellParam.C0 / (365 * 24 * 3600);
  inner SI.ElectricCharge C;
  inner SI.Current Icharge;
  
  Modelica.Electrical.Analog.Sources.SignalVoltage Voc annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  EnergyHarvestingWSN.Utilities.Conductor Gselfdis(G = Iselfdis/cellParam.E0) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  EnergyHarvestingWSN.Utilities.Resistor Rint(R = cellParam.R0) annotation(
    Placement(visible = true, transformation(origin = {30, 40}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyStorages.Components.Integrator integrator(SOCini = SOCini, symbol = "Q") annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  EnergyHarvestingWSN.EnergyStorages.Components.SoC soc annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyStorages.Components.Voc shepherd(cellParam = cellParam) annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  Icharge = Voc.i;
  Iout = -p.i;
  C = cellParam.C0; 
  isCriticalCharging = soc.SoC < 0.05 or soc.SoC > 0.95;
  
  connect(Rint.p, p) annotation(
    Line(points = {{40, 40}, {100, 40}, {100, 100}, {0, 100}}, color = {0, 0, 255}));
  connect(Gselfdis.p, p) annotation(
    Line(points = {{50, 10}, {50, 40}, {100, 40}, {100, 100}, {0, 100}}, color = {0, 0, 255}));
  connect(Voc.p, integrator.n) annotation(
    Line(points = {{0, -10}, {0, 0}}, color = {0, 0, 255}));
  connect(integrator.p, Rint.n) annotation(
    Line(points = {{0, 20}, {0, 40}, {20, 40}}, color = {0, 0, 255}));
  connect(soc.SoC, integrator.SoC) annotation(
    Line(points = {{-28, 40}, {-8, 40}, {-8, 22}}, color = {0, 0, 127}));
  connect(integrator.Q, soc.Q) annotation(
    Line(points = {{-11, 10}, {-60, 10}, {-60, 40}, {-52, 40}}, color = {0, 0, 127}));
  connect(shepherd.Q, integrator.Q) annotation(
    Line(points = {{-52, -20}, {-60, -20}, {-60, 10}, {-11, 10}}, color = {0, 0, 127}));
  connect(shepherd.Voc, Voc.v) annotation(
    Line(points = {{-28, -20}, {-12, -20}}, color = {0, 0, 127}));
  connect(Voc.n, n) annotation(
    Line(points = {{0, -30}, {0, -40}, {100, -40}, {100, -100}, {0, -100}}, color = {0, 0, 255}));
  connect(Gselfdis.n, n) annotation(
    Line(points = {{50, -10}, {50, -40}, {100, -40}, {100, -100}, {0, -100}}, color = {0, 0, 255}));

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(origin = {85, 40}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-2, 2}, {2, -2}}), Rectangle(origin = {85, -40}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-2, 2}, {2, -2}}), Text(origin = {13, 27}, textColor = {0, 136, 0}, extent = {{-8, -3}, {8, 3}}, textString = "Icharge", fontSize = 12), Line(origin = {4.76, 26.97}, points = {{0, 7}, {0, -7}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Text(origin = {-20, 14}, textColor = {0, 0, 127}, extent = {{-7, -3}, {7, 3}}, textString = "Q", fontSize = 12), Text(origin = {-20, 44}, textColor = {0, 0, 127}, extent = {{-7, -3}, {7, 3}}, textString = "SoC", fontSize = 12), Text(origin = {70, 50}, textColor = {0, 136, 0}, extent = {{-7, -3}, {7, 3}}, textString = "Iout", fontSize = 12), Line(origin = {69.3, 45}, points = {{-10, 0}, {10, 0}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Line(origin = {85, 0}, points = {{0, -30}, {0, 30}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Text(origin = {78, 0}, textColor = {0, 136, 0}, extent = {{-7, -3}, {7, 3}}, textString = "Vout", fontSize = 12)}),
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Line(points = {{-54, -100}, {54, -100}, {48, -100}}), Text(origin = {130, -90}, textColor = {255, 255, 255}, extent = {{-30, 10}, {-10, -10}}, textString = "%cellParam", fontSize = 1)}));
end Battery;
