within EnergyHarvestingWSN.Environment;
model ExpResults
  extends Icons.Block;
  extends Icons.Data;
  import SI = Modelica.SIunits;
  
  constant String rootPath = Modelica.Utilities.Files.loadResource("modelica://EnergyHarvestingWSN");
  parameter String fileName = "NoName" "file where experiment data is stored" annotation(
  Dialog(group="table data definition", enable = tableOnFile,
  __Dymola_loadSelector(filter="Text files (*.txt);;Matlab files (*.mat)", caption="Open file in which table is present")));


  SI.Voltage vin;
  SI.Current isc;  
  SI.Voltage ina1V;
  SI.Current ina1I;
  SI.Voltage ina2V;
  SI.Current ina2I;

protected
  // currently only used internally
  parameter Integer colTime = 1 "Column No of time data";
  parameter Integer colVin = 2 "Column No of input voltge data";
  parameter Integer colIsc = 3 "Column No of short-circuit data";
  parameter Integer colINA1V = 4 "Column No of INA1 voltage data";
  parameter Integer colINA1I = 5 "Column No of INA1 current data";
  parameter Integer colINA2V = 6 "Column No of INA2 voltage data";
  parameter Integer colINA2I = 7 "Column No of INA2 current data";

  Modelica.Blocks.Tables.CombiTable1Ds dataTable(columns = 1:10, fileName = rootPath + fileName, smoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, tableName = "tab1", tableOnFile = true) "Data reader" annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));

equation
  dataTable.u = mod(time, 365*24*3600);
  vin =   dataTable.y[2];
  isc =   dataTable.y[3];
  ina1V = dataTable.y[colINA1V];  
  ina1I = dataTable.y[colINA1I];
  ina2V = dataTable.y[colINA2V];
  ina2I = dataTable.y[colINA2I];
  
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));

end ExpResults;
