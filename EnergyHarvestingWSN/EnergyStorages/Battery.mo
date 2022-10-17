within EnergyHarvestingWSN.EnergyStorages;

model Battery "Battery cell model with a static internal impedance and self discharge"
  extends EnergyHarvestingWSN.Interfaces.PartialBattery;
  import SI = Modelica.Units.SI;
  
  SI.ElectricCharge Qabs, C;
  SI.Current Icell;
  Boolean isCriticalCharging;
  
  Modelica.Electrical.Analog.Sources.SignalVoltage Voc annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  EnergyHarvestingWSN.Utilities.Resistor RselfDis(R = cellParam.RselfDis) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
//  EnergyHarvestingWSN.Utilities.Resistor Ri annotation(
//    Placement(visible = true, transformation(origin = {0, 30}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.VariableResistor Ri annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  
initial equation
  Qabs = 0;

equation
  Icell = -Voc.i;
  der(Qabs) = abs(Icell);
  SOC = Q / C;

  der(Q) = -Icell; //if Q < 0.01*C and -Icell < 0 or Q > C and -Icell > 0 then 0 else -Icell;
  C = cellParam.C0;
// - cellParam.kageQ * max(Qabs / (2 * cellParam.C0) - cellParam.nage, 0);
//cellParam.SDan * cellParam.C0 / (365 * 24 * 3600);

  Voc.v = cellParam.E0 - cellParam.Epol * C / Q + cellParam.Av * exp(-cellParam.Bv * (C-Q));
  //test = exp( 100*(SOC-1));
  //Ri.R = if Q > C and -Icell > 0 then cellParam.R0 + 100 * (exp(SOC-1)-1) else cellParam.R0;
  //Ri.R = cellParam.R0; // * (1 + exp( 100*(SOC-1)));
  Ri.R = cellParam.R0;// + cellParam.Av * exp(-cellParam.Bv * (C-Q)); zu starke I-Abhängigkeit!
  
  isCriticalCharging = SOC < 0.05 or SOC > 0.95;
  
  
  connect(Voc.n, n) annotation(
    Line(points = {{0, -40}, {0, -100}}, color = {0, 0, 255}));
  connect(RselfDis.p, p) annotation(
    Line(points = {{50, 10}, {50, 60}, {0, 60}, {0, 100}}, color = {0, 0, 255}));
  connect(RselfDis.n, n) annotation(
    Line(points = {{50, -10}, {50, -60}, {0, -60}, {0, -100}}, color = {0, 0, 255}));
  connect(Ri.p, p) annotation(
    Line(points = {{0, 40}, {0, 100}}, color = {0, 0, 255}));
  connect(Ri.n, Voc.p) annotation(
    Line(points = {{0, 20}, {0, -20}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1)),
    Icon(coordinateSystem(initialScale = 0.1), graphics={Line(points = {{-54, -100}, {54, -100}, {48, -100}}), Text(origin = {130, -90}, lineColor = {255, 255, 255}, extent = {{-30, 10}, {-10, -10}}, textString = "%cellParam", fontSize = 1)}));
end Battery;
