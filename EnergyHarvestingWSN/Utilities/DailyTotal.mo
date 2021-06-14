within EnergyHarvestingWSN.Utilities;
model DailyTotal
  extends EnergyHarvestingWSN.Icons.Block;
  
  Real x;

  Modelica.Blocks.Interfaces.RealInput u "Continuous input signal" annotation(
    Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput y "Continuous output signal" annotation(
    Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));

equation
  der(x) = u;

algorithm
  when {sample(0, 24*3600), initial()} then
    y := x;
    reinit(x, 0);
  end when;
end DailyTotal;
