within EnergyHarvestingWSN.PowerConverter.Components;
model StartStop
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.BottomLabel;
  import SI = Modelica.Units.SI;

  parameter EnergyHarvestingWSN.Records.DCDC.template param annotation(
    choicesAllMatching = true, Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  outer SI.Voltage Vin, Vout, Vset;
  outer Boolean isOn;
  
  Modelica.Blocks.Interfaces.RealInput gin annotation (
    Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput gout annotation(
    Placement(visible = true, transformation(extent = {{100, -10}, {120, 10}}, rotation = 0), iconTransformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));

initial algorithm
  // Vout < param.Vset prevents switching ON if a storage with higher voltage is connected
  isOn := Vin > param.Vstart and Vout < Vset or
          param.isVOutPowered and Vin > param.Vmin and Vout > param.Vstart;
  
algorithm
  // startup  
  when Vin > param.Vstart and Vout <= Vset or
       param.isVOutPowered and Vin > param.Vmin and Vout > param.Vstart then
    isOn := true;
  end when;
  // shutdown
  when Vin < param.Vmin then
    isOn := false;
  end when;
  
  
equation
  // if fb = 0 then dG = 0 and thus G is not adjusted any longer
  gout = if isOn then gin else 0;
  
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
  Icon(graphics = {Line(origin = {-150.33, 60}, points = {{-30, 0}, {40, 0}}, color = {0, 136, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 15), Text(origin = {-150, 79}, lineColor = {0, 136, 0}, extent = {{-30, -19}, {30, 19}}, textString = "Vin"), Line(points = {{-80, -30}, {25, -30}, {25, 30}, {80, 30}, {-30, 30}, {-30, -30}})}));
end StartStop;
