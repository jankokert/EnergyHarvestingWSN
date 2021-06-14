within EnergyHarvestingWSN.Applications.DynamicDutyCycling;
model EnergyControl
  extends EnergyHarvestingWSN.Components.PartialEnergyControl;
  import SI = Modelica.Units.SI;

  // RAPU: Recommended Average Power Usage
  // Calculate the RAPU value every RAPUPeriod seconds
  inner parameter SI.Time RAPUPeriod = 3600;

  inner Real soc;
  inner Real powerIn;
  inner Real capacity;

  Real periodChangeCount;
  Real periodChangeVariation;

  EnergyHarvestingWSN.Applications.DynamicDutyCycling.AveragePower averagePower annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Applications.DynamicDutyCycling.CalcPeriods calcPeriods annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Applications.DynamicDutyCycling.PredictWCMA predictWCMA annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Applications.DynamicDutyCycling.DirectCommunication directComm annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  // Storage including power history
  inner Storage.Rec history;

initial algorithm
  periodChangeCount := 0;
  periodChangeVariation := 0;
  history.power := zeros(history.length);

algorithm
  // Measure how often the periods are changed
  when {change(calcPeriods.idealPeriods[1]), change(calcPeriods.idealPeriods[2])} then
    periodChangeCount := periodChangeCount + 1;
    periodChangeVariation := periodChangeVariation + (calcPeriods.idealPeriods[1]-pre(calcPeriods.idealPeriods[1]))^2 + (calcPeriods.idealPeriods[2]-pre(calcPeriods.idealPeriods[2]))^2;
  end when;

equation
  soc = energyInfo.EstoreTot / energyInfo.Ecapacity;
  powerIn = energyInfo.Pin;
  capacity = energyInfo.Ecapacity;
  
  connect(calcPeriods.idealPeriods, directComm.idealPeriods) annotation(
    Line(points = {{11, 0}, {28, 0}}, color = {255, 127, 0}, thickness = 0.5));
  connect(predictWCMA.prediction, calcPeriods.prediction) annotation(
    Line(points = {{-29, 0}, {-12, 0}}, color = {0, 0, 127}));
  connect(averagePower.powerOut, predictWCMA.averagePower) annotation(
    Line(points = {{-69, 0}, {-52, 0}}, color = {0, 0, 127}));
  
annotation(
  Diagram(graphics = {Line(points = {{0, -100}, {0, -30}, {-80, -30}, {-80, -10}}, color = {255, 170, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4),
  Line(points = {{100, 3}, {80, 3}, {80, 30}, {0, 30}, {0, 10}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4),
  Line(points = {{50, -3}, {90, -3}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4),
  Line(points = {{0, -30}, {0, -30}, {0, -10}}, color = {255, 170, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4),
  Text(origin = {-50, -35}, lineColor = {255, 170, 0}, extent = {{-24, 5}, {16, -5}}, textString = "input power", fontSize = 4),
  Text(origin = {24, -35}, lineColor = {255, 170, 0}, extent = {{-26, 17}, {-6, 7}}, textString = "SoC", fontSize = 4),
  Text(origin = {42, 36}, lineColor = {255, 0, 0}, extent = {{-38, 6}, {22, -6}}, textString = "interrogation: current state", fontSize = 4),
  Text(origin = {65, -12}, lineColor = {255, 0, 0}, extent = {{-11, 8}, {19, -8}}, textString = "response:\ncontrol", fontSize = 4, horizontalAlignment = TextAlignment.Left)}));

end EnergyControl;
