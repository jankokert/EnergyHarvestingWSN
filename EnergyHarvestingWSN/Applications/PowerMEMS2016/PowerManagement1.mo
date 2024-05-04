within EnergyHarvestingWSN.Applications.PowerMEMS2016;

block PowerManagement1
  extends EnergyHarvestingWSN.Components.PartialPowerManagement;
  extends EnergyHarvestingWSN.Interfaces.ConditionalMPPpin;
  import SI = Modelica.Units.SI;
  
  EnergyHarvestingWSN.PowerConverter.LDO ldo(param = EnergyHarvestingWSN.Records.LDOs.MCP1700_3V3()) annotation(
    Placement(visible = true, transformation(origin = {60, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverter.DCDC dcdc(TFB = 1E-5, fixedMPP = 0.5, kFB = 1E-5, param = EnergyHarvestingWSN.Records.DCDC.BQ25504(), useExternalMPP = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyStorages.SuperCap superCap2(capParam = EnergyHarvestingWSN.Records.SuperCaps.YEC_25F(), Vinit = 1.5) annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyStorages.SuperCap superCap1(capParam = EnergyHarvestingWSN.Records.SuperCaps.YEC_25F(), Vinit = 1.5) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  energyInfo.Pin = pin.v * pin.i;
  energyInfo.Pout = -pout.v * pout.i;
  energyInfo.EstoreTot = superCap1.Etot + superCap2.Etot;
  der(energyInfo.Eharv) = energyInfo.Pin;
  der(energyInfo.Econs) = energyInfo.Pout;
  
  connect(ldo.n, n) annotation(
    Line(points = {{60, 44}, {60, -80}, {0, -80}, {0, -100}}, color = {0, 0, 255}));
  connect(ldo.pout, pout) annotation(
    Line(points = {{70, 60}, {100, 60}}, color = {0, 0, 255}));
  connect(dcdc.pin, pin) annotation(
    Line(points = {{-60, 60}, {-100, 60}, {-100, 60}, {-100, 60}}, color = {0, 0, 255}));
  connect(dcdc.n, n) annotation(
    Line(points = {{-50, 44}, {-50, 44}, {-50, -80}, {0, -80}, {0, -100}, {0, -100}}, color = {0, 0, 255}));
  connect(superCap2.n, n) annotation(
    Line(points = {{0, -40}, {0, -40}, {0, -100}, {0, -100}}, color = {0, 0, 255}));
  connect(dcdc.pout, superCap1.p) annotation(
    Line(points = {{-40, 60}, {0, 60}, {0, 10}, {0, 10}, {0, 10}}, color = {0, 0, 255}));
  connect(superCap1.n, superCap2.p) annotation(
    Line(points = {{0, -10}, {0, -10}, {0, -20}, {0, -20}}, color = {0, 0, 255}));
  connect(ldo.pin, superCap1.p) annotation(
    Line(points = {{50, 60}, {0, 60}, {0, 10}, {0, 10}, {0, 10}}, color = {0, 0, 255}));
  connect(extMPP, dcdc.extMPP) annotation(
    Line(points = {{-104, 0}, {-80, 0}, {-80, 54}, {-60, 54}}, color = {0, 0, 127}));
end PowerManagement1;
