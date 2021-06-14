within EnergyHarvestingWSN.Utilities;
model LimI_Controller "Integrated controller with limited output"
  extends Modelica.Blocks.Interfaces.SISO;
  extends EnergyHarvestingWSN.Icons.Block;
  extends EnergyHarvestingWSN.Icons.LimI;
  extends EnergyHarvestingWSN.Icons.TopLabel;

  
  
  parameter Modelica.SIunits.Time T "Controller time constant";
  parameter Real outMax "Upper limit of output";
  
  Modelica.Blocks.Interfaces.BooleanOutput isLimited annotation(
    Placement(visible = true, transformation(extent = {{100, -70}, {120, -50}}, rotation = 0), iconTransformation(extent = {{100, -70}, {120, -50}}, rotation = 0)));

  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(outMax = outMax, k = 1/T) annotation(
    Placement(transformation(extent = {{20,-10},{40,10}}, rotation = 0)));
  //Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(extent = {{-120, -10}, {-100, 10}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  //Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal" annotation(Placement(visible = true, transformation(extent = {{100, -10}, {120, 10}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput fb annotation(
    Placement(visible = true, transformation(origin = {-40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {-40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));

  Real err;
  
equation
  err = u - fb;
  connect(limIntegrator.y, y) annotation(
    Line(points = {{41, 0}, {110, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  
  annotation(
    defaultComponentName = "LimI");
end LimI_Controller;
