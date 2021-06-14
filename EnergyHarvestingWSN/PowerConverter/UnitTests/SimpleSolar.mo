within EnergyHarvestingWSN.PowerConverter.UnitTests;
model SimpleSolar
  extends Modelica.Icons.Example;
  import SI = Modelica.SIunits;

  EnergyHarvestingWSN.EnergyHarvester.Solar.SolarCell solarCell(cellparam=EnergyHarvestingWSN.Records.SolarCells.StandardSi(), A = 0.001) annotation(
    Placement(visible = true, transformation(extent = {{-30, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant integerConstant1(k=1000) annotation(
    Placement(visible = true, transformation(extent = {{-56, -6}, {-44, 6}}, rotation = 0)));
  EnergyHarvestingWSN.Utilities.Ground ground annotation(
    Placement(visible = true, transformation(extent = {{10, -60}, {30, -40}}, rotation = 0)));
  EnergyHarvestingWSN.EnergyStorages.Battery store( SOCini= 0.01,cellParam=EnergyHarvestingWSN.Records.Batteries.eneloopAA()) annotation(
    Placement(visible = true, transformation(extent = {{10, -10}, {30, 10}}, rotation = 0)));
    
  SI.Energy Estore;
  
equation
  connect(solarCell.p, store.p) annotation(
    Line(points = {{-20, 10}, {-20, 10}, {-20, 20}, {20, 20}, {20, 10}, {20, 10}}, color = {0, 0, 255}));
  connect(store.n, ground.p) annotation(
    Line(points = {{20, -10}, {20, -40}}, color = {0, 0, 255}));
  connect(solarCell.n, ground.p) annotation(
    Line(points = {{-20, -10}, {-20, -15}, {-20, -15}, {-20, -20}, {20, -20}, {20, -30}, {20, -30}, {20, -40}}, color = {0, 0, 255}));
  connect(integerConstant1.y, solarCell.irradiance) annotation(
    Line(points = {{-43.4, 0}, {-29.4, 0}}, color = {0, 0, 127}));
  Estore = 1/2*store.C* (store.v)^2;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end SimpleSolar;
