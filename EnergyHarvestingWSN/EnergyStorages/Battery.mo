within EnergyHarvestingWSN.EnergyStorages;

model Battery "Battery cell model with a static internal impedance and self discharge"
  extends EnergyHarvestingWSN.Interfaces.PartialBattery;
  import SI = Modelica.Units.SI;
  
  Modelica.Electrical.Analog.Sources.SignalVoltage Voc annotation(
    Placement(transformation(origin = {0, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Modelica.Electrical.Analog.Sources.SignalCurrent IselfDis annotation(
    Placement(transformation(origin = {50, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  EnergyHarvestingWSN.Utilities.Resistor Ri(R = cellParam.R0) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));

  SI.ElectricCharge Qabs, C;
  SI.Current Icell;
  Boolean isCriticalCharging;
  
initial equation
  Qabs = 0;

equation
  Icell = -Voc.i;
  der(Qabs) = abs(Icell);
  SOC = Q / C;

  der(Q) = if Q < 0.01*C and -Icell < 0 or Q > C and -Icell > 0 then 0 else -Icell;
  C = cellParam.C0;// - cellParam.kageQ * max(Qabs / (2 * cellParam.C0) - cellParam.nage, 0);
  Voc.v = cellParam.E0 - cellParam.Epol * C/(Q+0.01*C) + cellParam.Av * exp(-(C-Q)/cellParam.Bv);
  IselfDis.i = 0;  //cellParam.SDan * cellParam.C0 / (365 * 24 * 3600);
  isCriticalCharging = SOC < 0.05 or SOC > 0.95;
  
  connect(Voc.n, n) annotation(
    Line(points = {{0, -70}, {0, -100}}, color = {0, 0, 255}));
  connect(IselfDis.p, p) annotation(
    Line(points = {{50, 40}, {50, 80}, {0, 80}, {0, 100}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(IselfDis.n, n) annotation(
    Line(points = {{50, 20}, {50, -80}, {0, -80}, {0, -100}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Ri.n, Voc.p) annotation(
    Line(points = {{0, -10}, {0, -50}}, color = {0, 0, 255}));
  connect(Ri.p, p) annotation(
    Line(points = {{0, 10}, {0, 100}}, color = {0, 0, 255}));
  
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics={Line(points = {{42, 30}, {20, 30}}, color = {0, 0, 255}), Text(lineColor = {0, 0, 255}, extent = {{40, 30}, {20, 40}}, textString = "=f(t,Qabs)"), Text(lineColor = {0, 0, 255}, extent = {{34, 2}, {16, 8}}, textString = "=f(T)"), Line(points = {{-8, -60}, {-30, -60}}, color = {0, 0, 255})}),
    Icon(coordinateSystem(initialScale = 0.1), graphics={Line(points = {{-54, -100}, {54, -100}, {48, -100}}), Text(origin = {130, -90}, lineColor = {255, 255, 255}, extent = {{-30, 10}, {-10, -10}}, textString = "%cellParam", fontSize = 1)}));
end Battery;
