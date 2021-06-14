within EnergyHarvestingWSN.EnergyStorages;

model Battery2
  "Battery cell model with a static internal impedance and self discharge"
  extends EnergyHarvestingWSN.Icons.Battery;
  import SI = Modelica.Units.SI;
  
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n "Negative pin" annotation(
    Placement(transformation(extent = {{-10, -110}, {10, -90}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p "Positive pin (potential p.v > n.v for positive voltage drop v)" annotation(
    Placement(transformation(extent = {{-10, 90}, {10, 110}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage Voc annotation(
    Placement(transformation(origin = {0, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Capacitor Cd(C = cellParam.Cd) annotation(
    Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-40,50})));
  EnergyHarvestingWSN.Utilities.Resistor R0(R = cellParam.R0) annotation(
    Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {0,-10})));
  EnergyHarvestingWSN.Utilities.Resistor Rd(R = cellParam.Rd) annotation(
    Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {0,50})));
  EnergyHarvestingWSN.Utilities.Resistor RselfDis(R = cellParam.RselfDis) annotation(
    Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {50,30})));

  parameter Records.Batteries.template cellParam annotation(
    choicesAllMatching = true, Placement(transformation(extent = {{-100.0, 80.0}, {-80.0, 100.0}}, origin = {0.0, 0.0}, rotation = 0), visible = true));
  parameter Real SOCini(start = 0.5) "Initial state of charge" annotation(Dialog(group = "Initialization"));
  parameter Modelica.SIunits.Temperature Toperational = 25 + 273.15 "Operational Temperature";
  parameter Real k1(start = 27);
  parameter Real k2(start = 1.00);
  parameter Real k3(start = 380);

  Real SOC;
  Boolean isCriticalCharging;
  SI.ElectricCharge Q, Qabs, C;
  SI.Current Icell;
  SI.Current Idown;
  SI.Voltage v;

initial equation
  Qabs = SOCini * C;
  Q = max(0.001*C, SOCini * C);

equation
  v = pin_p.v - pin_n.v;
  Icell = -Voc.i;
  der(Qabs) = abs(Icell);
  SOC = Q / C;

  //  der(Q) = if Q < 0.01*C and -Icell < 0  or  Q > C and -Icell > 0 then 0 else -Icell;
  //  der(Q) = -Icell;
  //  der(Q) = -Icell - k1*max(0, (Q-C*0.95)/C);
  // beim Entladen
  if SOC>k2 and Icell >= 0 then  //SOC>k2 and
    //    Idown = k1*(SOC-k2);
    // Current which flows, when SOC > 100%
    Idown = k1*(exp(SOC-k2)-1);
  else
    Idown = 0;
  end if;
  //  Idown =  max(0, k1* (SOC-k2)); //-k1*(Q-C*k2)/C ;
  //  der(Q) = if Q > C*k2 and Icell < 0 then -Icell-Idown else -Icell;
  // decrease acutal charge accumulation, then SOC > 100%
  der(Q) =  -Idown - (Icell / (1+k3*max(0, SOC-k2)));

  C = cellParam.C0 - cellParam.kageQ * max(Qabs / (2 * cellParam.C0) - cellParam.nage, 0);
  Voc.v = cellParam.E0 - cellParam.Elin * (C-Q)/C - cellParam.Epol * C/Q + cellParam.Av * exp(-cellParam.Bv * (C-Q));

  //+ (cellParam.Rirt - cellParam.Rel) * exp(-cellParam.Br * (Toperational - cellParam.Trt));
  isCriticalCharging = SOC < 0.05 or SOC > 0.95;

  connect(Cd.p, pin_p) annotation(
    Line(points = {{-40,60},{-40,80},{0,80},{0,100}}, color = {0,0,255}, smooth = Smooth.None));
  connect(Rd.p, pin_p) annotation(
    Line(points = {{0,60},{0,100}}, color = {0,0,255}, smooth = Smooth.None));
  connect(RselfDis.p, pin_p) annotation(
    Line(points = {{50,40},{50,80},{0,80},{0,100}}, color = {0,0,255}, smooth = Smooth.None));
  connect(RselfDis.n, Voc.n) annotation(
    Line(points = {{50,20},{50,-84},{0,-84},{0,-70}}, color = {0,0,255}, smooth = Smooth.None));
  connect(Voc.n, pin_n) annotation(
    Line(points = {{0,-70},{0,-100}}, color = {0,0,255}, smooth = Smooth.None));
  connect(R0.n, Voc.p) annotation(
    Line(points = {{0,-20},{0,-50}}, color = {0,0,255}, smooth = Smooth.None));
  connect(Rd.n, R0.p) annotation(
    Line(points = {{0,40},{0,0}}, color = {0,0,255}, smooth = Smooth.None));
  connect(Cd.n, R0.p) annotation(
    Line(points = {{-40,40},{-40,20},{0,20},{0,0},{0,0}}, color = {0,0,255}, smooth = Smooth.None));

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}, initialScale = 0.1), graphics = {Text(extent = {{34, 2}, {16, 8}}, lineColor = {0, 0, 255}, textString = "=f(T)"), Line(points = {{-8, -60}, {-30, -60}}, color = {0, 0, 255}, smooth = Smooth.None)}),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1), graphics = {Line(points = {{-54, -100}, {54, -100}, {48, -100}}, color = {0, 0, 0})}));
end Battery2;
