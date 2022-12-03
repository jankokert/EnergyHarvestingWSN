within EnergyHarvestingWSN.Utilities;
model CCCV
  extends EnergyHarvestingWSN.Icons.Source;
  extends EnergyHarvestingWSN.Interfaces.Source;
  import SI = Modelica.Units.SI;

  parameter SI.Voltage Vmax "Max output voltage";
  parameter SI.Current Imax "Max output current";
  parameter SI.Time T = 0.001 "Controller time constant";
  
  EnergyHarvestingWSN.Utilities.PI_Controller pi(k=1, T=T) annotation(
    Placement(transformation(extent={{-60,-10},{-40,10}})));

  Real u1, u2;
  
equation
  u1 = Vmax - Vout;
  u2 = Imax - Iout;
  pi.u = min(u1, u2);
  pi.y = Iout;

  annotation(
    Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CCCV;
