within EnergyHarvestingWSN.EnergyHarvester.Solar;

model SolarCell
  extends EnergyHarvestingWSN.Interfaces.PartialSolar;
  import SI = Modelica.Units.SI;
  parameter SI.Temperature T = 298;

  final constant SI.Irradiance onesun = 1000;
  Modelica.Electrical.Analog.Sources.SignalCurrent Iph(v(start = 1)) annotation(
    Placement(transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  EnergyHarvestingWSN.Utilities.Diode D1_Emitter(nideal = param.n1, Ids = param.J01*A, T = T) annotation(
    Placement(transformation(origin = {-28, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  EnergyHarvestingWSN.Utilities.Diode D2_SCR(nideal = param.n2, Ids = param.J02*A, T = T) annotation(
    Placement(transformation(origin = {-6, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  EnergyHarvestingWSN.Utilities.Resistor Rshunt(R = param.Rp/A) annotation(
    Placement(transformation(origin = {16, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  EnergyHarvestingWSN.Utilities.Resistor Rseries(R = param.Rs/A) annotation(
    Placement(transformation(origin = {-40, 0}, extent = {{60, 10}, {80, 30}})));

equation
  Iph.i = irradiance * A * param.Jsc / onesun;
  Pirr = irradiance*A;
  connect(Rseries.p, Iph.n) annotation(
    Line(points = {{20, 20}, {-50, 20}, {-50, 10}}, color = {0, 0, 255}));
  connect(D1_Emitter.p, Rseries.p) annotation(
    Line(points = {{-28, 10}, {-28, 20}, {20, 20}}, color = {0, 0, 255}));
  connect(D2_SCR.p, Rseries.p) annotation(
    Line(points = {{-6, 10}, {-6, 20}, {20, 20}}, color = {0, 0, 255}));
  connect(Rshunt.p, Rseries.p) annotation(
    Line(points = {{16, 10}, {16, 20}, {20, 20}}, color = {0, 0, 255}));
  connect(Iph.p, D1_Emitter.n) annotation(
    Line(points = {{-50, -10}, {-50, -20}, {-28, -20}, {-28, -10}}, color = {0, 0, 255}));
  connect(D1_Emitter.n, D2_SCR.n) annotation(
    Line(points = {{-28, -10}, {-28, -20}, {-6, -20}, {-6, -10}}, color = {0, 0, 255}));
  connect(D2_SCR.n, Rshunt.n) annotation(
    Line(points = {{-6, -10}, {-6, -20}, {16, -20}, {16, -10}}, color = {0, 0, 255}));
  connect(irradiance, gain.u) annotation(
    Line(points = {{-110, 0}, {-90, 0}}, color = {0, 0, 127}));
  connect(gain.y, Iph.i) annotation(
    Line(points = {{-71, 0}, {-62, 0}}, color = {0, 0, 127}));
  connect(p, P) annotation(
    Line(points = {{0, 100}, {0, 80}, {100, 80}, {100, 20}, {50, 20}}, color = {0, 0, 255}));
  connect(Rseries.n, P) annotation(
    Line(points = {{40, 20}, {50, 20}}, color = {0, 0, 255}));
  connect(Rshunt.n, N) annotation(
    Line(points = {{16, -10}, {16, -20}, {50, -20}}, color = {0, 0, 255}));
  connect(N, n) annotation(
    Line(points = {{50, -20}, {100, -20}, {100, -100}, {0, -100}}, color = {0, 0, 255}));

protected // only for documentation
  Modelica.Electrical.Analog.Interfaces.PositivePin P annotation(
    Placement(transformation(origin = {50, 20}, extent = {{-6, -6}, {6, 6}}), iconTransformation(origin = {80, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin N annotation(
    Placement(transformation(origin = {50, -20}, extent = {{6, -6}, {-6, 6}}), iconTransformation(origin = {82, 0}, extent = {{-10, -10}, {10, 10}})));
  EnergyHarvestingWSN.Utilities.Gain gain(k = A*param.Jsc*onesun) annotation(
    Placement(transformation(origin = {-80, 0}, extent = {{-8, -8}, {8, 8}})));

  annotation(
    Diagram,
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Text(origin = {90, -90}, lineColor = {255, 255, 255}, extent = {{-10, 10}, {10, -10}}, textString = "%param", fontSize = 1)}),
    Documentation(info = "<html><head></head><body>Rule of thumb: 40mA per 1cm² and at 1000W.<div>This is 400A per 1m² and are 1000W and consequently 0.4A per 1m² and 1W</div></body></html>"));
end SolarCell;
