within EnergyHarvestingWSN.EnergyStorages;

model Battery3
  "Battery cell model with a static internal impedance and self discharge"
  extends EnergyHarvestingWSN.Icons.Battery;
  import SI = Modelica.Units.SI;

  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n "Negative pin" annotation(Placement(transformation(extent = {{-10, -110}, {10, -90}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
    "Positive pin (potential p.v > n.v for positive voltage drop v)"  annotation(Placement(transformation(extent = {{-10, 90}, {10, 110}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage Voc annotation(Placement(transformation(origin = {0, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Utilities.Resistor RselfDis(R=cellParam.RselfDis) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,30})));
  Modelica.Electrical.Analog.Basic.VariableResistor Ri annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin={0,-20})));

  Modelica.Electrical.Analog.Basic.Capacitor Cd(C=cellParam.Cd) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,50})));
  Modelica.Electrical.Analog.Basic.VariableResistor Rd annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin={0,50})));

  parameter Records.Batteries.template cellParam annotation(__Dymola_choicesAllMatching = true, Placement(transformation(extent = {{-100.0, 80.0}, {-80.0, 100.0}}, origin = {0.0, 0.0}, rotation = 0), visible = true));
  parameter Real SOCini(start = 1) "Initial state of charge" annotation(Dialog(group = "Initialization"));
  parameter Modelica.SIunits.Temperature Toperational = 25 + 273.15
    "Operational Temperature";

  Real SOC;
  SI.ElectricCharge Q, Qabs, C;
  SI.Current Icell;
  SI.Voltage v;
  Boolean isCriticalCharging;

initial equation
  Qabs = SOCini * C;
  Q = max(0.001*C, SOCini * C);

equation
  v = pin_p.v - pin_n.v;
  Icell = -Voc.i;

  Ri.R = cellParam.R0;  // sollte linear und exp. sein.
  Rd.R = -cellParam.Rd * log(1-SOC);

  der(Qabs) = abs(Icell);
//  der(Q) = if Q < 0.01*C and -Icell < 0 or Q > C and -Icell > 0 then 0 else -Icell;
  der(Q) =  -Icell;

  SOC = Q / C;

  C = cellParam.C0 - cellParam.kageQ * max(Qabs / (2 * cellParam.C0) - cellParam.nage, 0);
  Voc.v = cellParam.E0 - cellParam.Elin * (C-Q)/C - cellParam.Epol * C/Q + cellParam.Av * exp(-cellParam.Bv * (C-Q));

  isCriticalCharging = SOC < 0.05 or SOC > 0.95;

  connect(RselfDis.p, pin_p) annotation (Line(
      points={{50,40},{50,80},{0,80},{0,100}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(RselfDis.n, Voc.n) annotation (Line(
      points={{50,20},{50,-84},{0,-84},{0,-70}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Voc.n, pin_n) annotation (Line(
      points={{0,-70},{0,-100}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Ri.n, Voc.p) annotation (Line(
      points={{-6.66134e-016,-30},{-6.66134e-016,-38},{0,-38},{0,-50}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Rd.p, pin_p) annotation (Line(
      points={{0,60},{0,100}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Cd.p, pin_p) annotation (Line(
      points={{-40,60},{-40,80},{0,80},{0,100}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Rd.n, Ri.p) annotation (Line(
      points={{0,40},{0,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Cd.n, Ri.p) annotation (Line(
      points={{-40,40},{-40,20},{0,20},{0,-10},{6.10623e-016,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}},                                                                           initialScale = 0.1), graphics={                                                                                                    Text(extent={{
              -22,-24},{-40,-18}},                                                                                                lineColor=
              {0,0,255},
          textString="=f(SOC)"),                                                                                                    Line(points=  {{-8, -60}, {-30, -60}}, color=  {0, 0, 255}, smooth=  Smooth.None)}),
                                                                                                    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1), graphics={  Line(points = {{-54, -100}, {54, -100}, {48, -100}}, color = {0, 0, 0})}));
end Battery3;
