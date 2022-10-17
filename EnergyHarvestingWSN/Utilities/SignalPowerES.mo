within EnergyHarvestingWSN.Utilities;
model SignalPowerES "Signal power discharging device"
  extends EnergyHarvestingWSN.Icons.Sink;
  
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent annotation(Placement(transformation(origin = {20,0}, extent = {{-10,10},{10,-10}}, rotation = 270)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(transformation(extent = {{-10,90},{10,110}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(transformation(extent = {{-10,-110},{10,-90}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation(Placement(transformation(origin = {60,0}, extent = {{-10,10},{10,-10}}, rotation = 270)));
  Modelica.Blocks.Math.Product product annotation(Placement(transformation(origin = {-30,-50}, extent = {{-10,-10},{10,10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealInput power annotation(Placement(transformation(extent = {{-100,-10},{-80,10}}, rotation = 0)));
  parameter Modelica.SIunits.Time T = 1 "Controller time constant";
  parameter Modelica.SIunits.Current Imax "Upper current limit of controller";
  EnergyHarvestingWSN.Utilities.LimI_Controller limitedController(outMax = Imax, T = T) annotation(Placement(transformation(extent = {{-60,-10},{-40,10}})));

equation
  connect(signalCurrent.p,pin_p) annotation(Line(points = {{20,10},{20,100},{0,100}}, color = {0,0,255}));
  connect(signalCurrent.n,pin_n) annotation(Line(points = {{20,-10},{20,-100},{0,-100}}, color = {0,0,255}));
  connect(product.u1,voltageSensor.v) annotation(Line(points = {{-18,-56},{80,-56},{80,0},{70,0}}, color = {0,0,127}));
  connect(voltageSensor.n,signalCurrent.n) annotation(Line(points = {{60,-10},{60,-20},{20,-20},{20,-10}}, color = {0,0,255}));
  connect(voltageSensor.p,signalCurrent.p) annotation(Line(points = {{60,10},{60,20},{20,20},{20,10}}, color = {0,0,255}));
  connect(product.u2,signalCurrent.i) annotation(Line(points = {{-18,-44},{0,-44},{0,0},{13,0}}, color = {0,0,127}));
  connect(limitedController.y,signalCurrent.i) annotation(Line(points = {{-39,0},{13,0}}, color = {0,0,127}, smooth = Smooth.None));
  connect(power,limitedController.u) annotation(Line(points = {{-90,0},{-59,0}}, color = {0,0,127}, smooth = Smooth.None));
  connect(limitedController.fb,product.y) annotation(Line(points = {{-54,-9},{-54,-50},{-41,-50}}, color = {0,0,127}, smooth = Smooth.None));
  
  annotation(Icon(graphics={Text(extent = {{-38,18},{-86,-18}}, lineColor = {0,0,127}, textString = "P")}),
  Diagram(graphics));
end SignalPowerES;
