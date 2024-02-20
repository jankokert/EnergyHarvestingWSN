within EnergyHarvestingWSN.Applications.DynamicDutyCycling;

model PowerManagement
  extends EnergyHarvestingWSN.Interfaces.PartialPowerManagement;
  import SI = Modelica.SIunits;
  EnergyHarvestingWSN.EnergyStorages.SuperCap superCap1(capParam = EnergyHarvestingWSN.Records.SuperCaps.YEC_25F(), Vinit=3)  annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Icons.RoundSensor roundSensor(symbol = "P")  annotation(
    Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.DCDC dcdc1(fixedMPP = 4, param = EnergyHarvestingWSN.Records.DCDC.BQ25504())  annotation(
    Placement(visible = true, transformation(origin = {-30, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.LDO myLDO(param = EnergyHarvestingWSN.Records.LDOs.MCP1700_3V3())  annotation(
    Placement(visible = true, transformation(origin = {50, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  energyInfo.Eharv = 0;
  energyInfo.Econs = 0;
equation
  connect(myLDO.n, n) annotation(
    Line(points = {{50, 44}, {50, -52}, {0, -52}, {0, -100}}, color = {0, 0, 255}));
  connect(myLDO.pout, pout) annotation(
    Line(points = {{60, 60}, {100, 60}, {100, 60}, {100, 60}}, color = {0, 0, 255}));
  connect(myLDO.pin, superCap1.p) annotation(
    Line(points = {{40, 60}, {0, 60}, {0, -10}, {0, -10}}, color = {0, 0, 255}));
  connect(dcdc1.n, n) annotation(
    Line(points = {{-30, 44}, {-30, 44}, {-30, -52}, {0, -52}, {0, -100}, {0, -100}}, color = {0, 0, 255}));
  connect(dcdc1.pout, superCap1.p) annotation(
    Line(points = {{-20, 60}, {0, 60}, {0, -10}, {0, -10}}, color = {0, 0, 255}));
  connect(pin, dcdc1.pin) annotation(
    Line(points = {{-100, 60}, {-40, 60}, {-40, 60}, {-40, 60}}, color = {0, 0, 255}));
  connect(superCap1.n, n) annotation(
    Line(points = {{0, -28}, {0, -100}}, color = {0, 0, 255}));
  energyInfo.Pin = pin.v * pin.i;
  energyInfo.Pout = -pout.v * pout.i;
  der(energyInfo.Eharv) = energyInfo.Pin;
  der(energyInfo.Econs) = energyInfo.Pout;
  energyInfo.EstoreTot = superCap1.Etot;
  energyInfo.Ecapacity = 1 / 2 * 25 * 5.5 ^ 2;
  annotation(
    Diagram(graphics = {Line(origin = {0.299482, 0},points = {{8, -20}, {80, -20}, {80, 85}, {3, 85}, {3, 95}}, color = {255, 170, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Text(origin = {56, 91}, lineColor = {255, 170, 0}, extent = {{-22, 5}, {22, -5}}, textString = "SoC", fontSize = 3), Line(points = {{-70, 60}, {-70, 85}, {-3, 85}, {-3, 95}}, color = {255, 170, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Text(origin = {-44, 91}, lineColor = {255, 170, 0}, extent = {{-22, 5}, {22, -5}}, textString = "input power", fontSize = 3)}, coordinateSystem(initialScale = 0.1)));
end PowerManagement;
