within EnergyHarvestingWSN.PowerConverter;
model LDO "Low dropout (LDO) voltage regulator"
  extends EnergyHarvestingWSN.Interfaces.PartialPowerConverter;
  extends EnergyHarvestingWSN.Icons.LDO;  

  parameter EnergyHarvestingWSN.Records.LDOs.template param "Select one LDO type" annotation(
    choicesAllMatching = true, Placement(visible = true, transformation(extent = {{-100, 80}, {-80, 100}}, rotation = 0)));
 
  EnergyHarvestingWSN.Utilities.Resistor Rleak(R = param.Rleak) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  EnergyHarvestingWSN.Utilities.VariableConductor Gpass annotation(
    Placement(visible = true, transformation(extent = {{20, 70}, {40, 50}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.LimP controller(k = 100, yMax = 1/param.Ron, yMin = 0) annotation(
    Placement(visible = true, transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0)));

algorithm
  when initial() then
    isOn := true;
  end when;
  
equation
  connect(controller.y, Gpass.G) annotation(
    Line(points = {{12, 0}, {30, 0}, {30, 50}, {30, 50}}, color = {0, 0, 127}));
  controller.u = param.VoutSet - Vout;  // this order (set-actual) is important!

  //Old stuff: Current limit not yet successfully implemented
  //GiLim = Type.Ilimit/max(0.1, Gpass.v);  // d.h. gilt erst ab 0.1V
  //LimP.yMax = 1/Type.Ron / (10*max(1, Iout/Type.Ilimit));
  //LimP.yMax = min(1 / Type.Ron, GiLim);
  connect(Rleak.n, n) annotation(
    Line(points = {{50, -20}, {50, -80}, {0, -80}, {0, -100}}, color = {0, 0, 255}));
  connect(Rleak.p, pout) annotation(
    Line(points = {{50, 0}, {50, 60}, {100, 60}}, color = {0, 0, 255}));
  connect(Gpass.p, pin) annotation(
    Line(points = {{20, 60}, {-100, 60}}, color = {0, 0, 255}));
  connect(Gpass.n, pout) annotation(
    Line(points = {{40, 60}, {100, 60}}, color = {0, 0, 255}));
  
  annotation(
    defaultComponentName = "myLDO",
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Diagram(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1)));
end LDO;
