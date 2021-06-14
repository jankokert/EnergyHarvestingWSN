within EnergyHarvestingWSN.EnergyStorages.UnitTests;
model Cap2Batt
  extends Modelica.Icons.Example;
  import SI = Modelica.SIunits;
  
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(transformation(extent = {{30,-90},{50,-70}})));
  EnergyHarvestingWSN.EnergyStorages.Battery store(cellParam = EnergyHarvestingWSN.Records.Batteries.eneloopAA(), SOCini = 0.1) annotation(
    Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 2) annotation(
    Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-60,-2})));
  Modelica.Electrical.Analog.Basic.Capacitor cap(C = 1000) annotation(
    Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {0,-30})));
  EnergyHarvestingWSN.Utilities.Resistor r1(R = 1) annotation(
    Placement(transformation(extent={{-40,10},{-20,30}})));
  EnergyHarvestingWSN.Utilities.IdealSPDT sw1 annotation(
    Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin = {0,0})));

  Boolean isWorking;
  
equation
  //if (cap.p.v - store.pin_p.v) > 0.1 and sw1.control == false then
  //  sw1.control = true;
  //else if (cap.p.v - store.pin_p.v) > 0.05 and sw1.control == true then
  //  sw1.control = false;
  //end if;
  /*
  if pre(sw1.control) and (cap.p.v - store.pin_p.v) < 0.05 then
    sw1.control = false;
  else
    sw1.control = true;
  end if;

  if not pre(sw1.control) and (cap.p.v - store.pin_p.v) > 0.1 then
    sw1.control = true;
  else
    sw1.control = false;
  end if;
  */

  if pre(isWorking) then
    isWorking = store.pin_p.i > 0.1; //true; //(cap.p.v - store.pin_p.v) > 0.001;
  else
    isWorking = (cap.p.v - store.pin_p.v) > 0.1;
  end if;

  //  sw1.control = false; isWorking;
  sw1.control = time > 1200;

  connect(store.pin_n, ground.p) annotation(
    Line(points = {{40,-10},{40,-70}}, color = {0,0,255}, smooth = Smooth.None));
  connect(constantVoltage.n, ground.p) annotation(
    Line(points = {{-60,-12},{-60,-60},{40,-60},{40,-70}}, color = {0,0,255}, smooth = Smooth.None));
  connect(cap.n, ground.p) annotation(
    Line(points = {{0,-40},{0,-60},{40,-60},{40,-70}}, color = {0,0,255}, smooth = Smooth.None));
  connect(r1.p, constantVoltage.p) annotation (
    Line(points = {{-40,20},{-60,20},{-60,8}}, color = {0,0,255}, smooth = Smooth.None));
  connect(sw1.p, cap.p) annotation(
    Line(points = {{0,-10},{0,-20}}, color = {0,0,255}, smooth = Smooth.None));
  connect(sw1.n2, store.pin_p) annotation(
    Line(points = {{0,10},{0,20},{40,20},{40,10}}, color = {0,0,255}, smooth = Smooth.None));
  connect(sw1.n1, r1.n) annotation(
    Line(points = {{-5,10},{-10,10},{-10,20},{-20,20}}, color = {0,0,255}, smooth = Smooth.None));

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
end Cap2Batt;
