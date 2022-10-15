within EnergyHarvestingWSN.EnergyStorages.UnitTests;
model Battery_self_discharge
  extends Modelica.Icons.Example;
  EnergyHarvestingWSN.Utilities.Ground ground annotation(
    Placement(visible = true, transformation(origin={0,-20}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
  EnergyStorages.Battery2 battery(cellParam=EnergyHarvestingWSN.Records.Batteries.WBLYP40(), SOCini=1) annotation(
    Placement(transformation(extent={{-10,12},{10,32}})));

equation
  connect(battery.n, ground.p) annotation(
    Line(points={{0,12},{0,-10}}, color={0,0,255}, smooth=Smooth.None));

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end Battery_self_discharge;
