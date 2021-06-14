within EnergyHarvestingWSN.Environment;
model Isc
  extends Icons.SolarIrradiation;

  constant String rootPath = Modelica.Utilities.Files.loadResource("modelica://EnergyHarvestingWSN");
  parameter String fileName = "NoName" "file where environment data is stored" annotation(
  Dialog(group="table data definition", enable = tableOnFile,
  __Dymola_loadSelector(filter="Text files (*.txt);;Matlab files (*.mat)", caption="Open file in which table is present")));
  parameter Integer colTime = 1 "Column No of time data";
  parameter Integer colIsc = 2 "Column No of short-circuit data";
  
  Modelica.Blocks.Interfaces.RealOutput iscOutput(final quantity = "Current", final unit = "A") "short-circuit current" annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

protected
  Modelica.Blocks.Tables.CombiTable1Ds dataTable(columns = {colTime, colIsc}, fileName = rootPath + fileName, smoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, tableName = "tab1", tableOnFile = true) "Data reader" annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));

equation
  dataTable.u = mod(time, 365*24*3600);
  iscOutput = max(0, dataTable.y[2]);

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));

end Isc;
