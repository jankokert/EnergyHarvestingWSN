within EnergyHarvestingWSN.PowerConverter.Components;
model Efficiency
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.BottomLabel;
  import SI = Modelica.Units.SI;

  parameter EnergyHarvestingWSN.Records.DCDC.template param annotation(
    choicesAllMatching = true, Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  outer SI.Voltage Vin, Vout;
  outer SI.Current Iin, Iout;
  outer Boolean isOn;
  
  Modelica.Blocks.Interfaces.RealInput pin(unit="P") annotation (
    Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput pout(unit="P") annotation(
    Placement(visible = true, transformation(extent = {{100, -10}, {120, 10}}, rotation = 0), iconTransformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
  
  SI.Power Ploss, Pout_int;
  
equation
  Ploss = param.k3
        + (param.k1 + param.k2*sqrt(max(0,Vin))) * Iin
        + param.k4 * Iin^2;
        //+ (3.15 - 0.6*Vout) * Iin^2;
  Pout_int = pin - Ploss;
  
  // if clause with Iin is needed for startup (do not check on isOn or Vin>0)
  if pin > 0 and  Pout_int > 0 then
    pout = Pout_int;
  else
    pout = 0;
  end if;
    
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
  Icon(graphics = {Line(origin = {80, 110}, points = {{0, 50}, {0, 0}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 15), Text(origin = {-39, 139}, lineColor = {0, 136, 0}, extent = {{-45, -19}, {45, 19}}, textString = "Vin", horizontalAlignment = TextAlignment.Left), Line(origin = {-10, 110}, points = {{0, 50}, {0, 0}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 15), Text(origin = {131, 139}, lineColor = {0, 136, 0}, extent = {{-45, -19}, {45, 19}}, textString = "Vout", horizontalAlignment = TextAlignment.Left), Text(origin = {43, 139}, lineColor = {0, 136, 0}, extent = {{-45, -19}, {45, 19}}, textString = "Iout", horizontalAlignment = TextAlignment.Left), Line(origin = {-90, 110}, points = {{0, 50}, {0, 0}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 15), Line(points = {{-70, -60}, {-52, 50}, {22, 50}, {65, 38}}, color = {170, 0, 0}, smooth = Smooth.Bezier), Line(origin = {-70, -65}, points = {{0, 0}, {0, 130}}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 7), Line(origin = {-70, -65}, points = {{0, 0}, {140, 0}}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 7)}));
end Efficiency;
