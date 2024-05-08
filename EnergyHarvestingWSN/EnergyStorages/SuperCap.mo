within EnergyHarvestingWSN.EnergyStorages;

model SuperCap "Ideal linear electrical capacitor"
  import SI = Modelica.Units.SI;
  extends EnergyHarvestingWSN.Interfaces.TwoPin;
  extends EnergyHarvestingWSN.Icons.SuperCap;
  
  parameter Records.SuperCaps.template capParam annotation(
    choicesAllMatching = true,
    Placement(transformation(extent = {{-100.0, 80.0}, {-80.0, 100.0}}, origin = {0.0, 0.0}, rotation = 0), visible = true));
  parameter SI.Voltage Vinit = 1;
  
  SI.Current Icharge;
  SI.Energy Ei "Energy in Immediate branch";
  SI.Energy Ed "Energy in Delayed branch";
  SI.Energy El "Energy in Long-term branch";
  SI.Energy Etot "Energy of all branches";
  SI.Time ti "Time constant of Immediate branch";
  SI.Time td "Time constant of Delayed branch";
  SI.Time tl "Time constant of Longterm branch";
  EnergyHarvestingWSN.Utilities.Resistor Ri(R = capParam.Ri) annotation(
    Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  EnergyHarvestingWSN.Utilities.Resistor Rd(R = capParam.Rd) annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  EnergyHarvestingWSN.Utilities.Resistor Rl(R = capParam.Rl) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  EnergyHarvestingWSN.Utilities.Resistor Rleak(R = capParam.Rleak) annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  EnergyHarvestingWSN.Utilities.VarCap Ci(C0 = capParam.Ci0, Cv = capParam.Civ, Vout(start = Vinit, fixed = true)) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-40, -10})));
  Modelica.Electrical.Analog.Basic.Capacitor Cd(C = capParam.Cd, v(start = Vinit, fixed = true)) annotation(
    Placement(transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Capacitor Cl(C = capParam.Cl, v(start = Vinit, fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));

equation
  Ei = 1/2 * Ci.C0 * Ci.Vout^2 + 1/3 * Ci.Cv * Ci.Vout^3;
  Ed = 1/2 * Cd.C * Cd.v^2;
  El = 1/2 * Cl.C * Cl.v^2;
  Icharge = p.i;
  Etot = Ei + Ed + El;
  ti = Ci.C * Ri.R;
  td = Cd.C * Rd.R;
  tl = Cl.C * Rl.R;
  
  connect(Rl.p, Rd.n) annotation(
    Line(points = {{50, 10}, {50, 10}, {50, 14}, {10, 14}, {10, 20}, {10, 20}}, color = {0, 0, 255}));
  connect(Rl.n, Cl.p) annotation(
    Line(points = {{50, -8}, {50, -20}}, color = {0, 0, 255}));
  connect(Rd.p, Ri.n) annotation(
    Line(points = {{10, 40}, {10, 40}, {10, 44}, {-40, 44}, {-40, 50}, {-40, 50}}, color = {0, 0, 255}));
  connect(Rd.n, Cd.p) annotation(
    Line(points = {{10, 22}, {10, 0}}, color = {0, 0, 255}));
  connect(Rleak.p, p) annotation(
    Line(points = {{80, 10}, {80, 10}, {80, 80}, {0, 80}, {0, 100}, {0, 100}}, color = {0, 0, 255}));
  connect(Rleak.n, n) annotation(
    Line(points = {{80, -10}, {80, -60}, {0, -60}, {0, -100}}, color = {0, 0, 255}));
  connect(Cl.n, n) annotation(
    Line(points = {{50, -38}, {50, -60}, {0, -60}, {0, -100}}, color = {0, 0, 255}));
  connect(Ci.n, n) annotation(
    Line(points = {{-40, -20}, {-40, -60}, {0, -60}, {0, -100}}, color = {0, 0, 255}));
  connect(Cd.n, n) annotation(
    Line(points = {{10, -20}, {10, -60}, {0, -60}, {0, -100}}, color = {0, 0, 255}));
  connect(Ci.p, Ri.n) annotation(
    Line(points = {{-40, 0}, {-40, 48}}, color = {0, 0, 255}));
  connect(Ri.p, p) annotation(
    Line(points = {{-40, 68}, {-40, 80}, {0, 80}, {0, 100}}, color = {0, 0, 255}));
  annotation(
    Documentation(info = "<html>
<p>The linear capacitor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i = C * dv/dt</i>. The Capacitance <i>C</i> is allowed to be positive or zero.</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1)),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end SuperCap;
