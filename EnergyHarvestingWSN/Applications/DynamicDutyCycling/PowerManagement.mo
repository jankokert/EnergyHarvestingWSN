within EnergyHarvestingWSN.Applications.DynamicDutyCycling;

model PowerManagement
  extends EnergyHarvestingWSN.Components.PartialPowerManagement;
  extends EnergyHarvestingWSN.Components.EnergyAnalysis;
  import SI = Modelica.SIunits;

  EnergyHarvestingWSN.Interfaces.EnergyInfo energyInfo annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyStorages.SuperCap superCap1(capParam = EnergyHarvestingWSN.Records.SuperCaps.YEC_25F(), Vinit=3)  annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.Icons.RoundSensor roundSensor(symbol = "P")  annotation(
    Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.DCDC dcdc1(fixedMPP = 4, param = EnergyHarvestingWSN.Records.DCDC.BQ25504())  annotation(
    Placement(visible = true, transformation(origin = {-30, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.PowerConverter.LDO myLDO(param = EnergyHarvestingWSN.Records.LDOs.MCP1700_3V3())  annotation(
    Placement(visible = true, transformation(origin = {50, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

 
equation
  Pharv = pin.v * pin.i;
  Pcons = -pout.v * pout.i;
  Pstore = superCap1.Vout * superCap1.p.i;
  EstoreAbs = superCap1.Etot;
  EstoreMax = 1/2 * 25 * 5.5 ^ 2;
  
  energyInfo.Pharv = Pharv;
  energyInfo.Eharv = Eharv;  
  energyInfo.Pcons = Pcons;
  energyInfo.Econs = Econs;  
  energyInfo.Pstore = Pstore;
  energyInfo.Estore = Estore;
  energyInfo.EstoreAbs = EstoreAbs;
  energyInfo.EstoreMax = EstoreMax;
  
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
 
  annotation(
    Diagram(graphics = {Line(origin = {0.0, 0},points = {{8, -20}, {80, -20}, {80, 85}, {3, 85}, {3, 95}}, color = {255, 170, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Text(origin = {56, 91}, textColor = {255, 170, 0}, extent = {{-22, 5}, {22, -5}}, textString = "SoC", fontSize = 12), Line(points = {{-70, 60}, {-70, 85}, {-3, 85}, {-3, 95}}, color = {255, 170, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Text(origin = {-44, 91}, textColor = {255, 170, 0}, extent = {{-22, 5}, {22, -5}}, textString = "input power", fontSize = 12)}, coordinateSystem(initialScale = 0.1)));
end PowerManagement;
