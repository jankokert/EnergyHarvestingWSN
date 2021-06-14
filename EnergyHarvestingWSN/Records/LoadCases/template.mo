within EnergyHarvestingWSN.Records.LoadCases;
record template
  extends Modelica.Icons.Record;
  import SI = Modelica.Units.SI;
  
  parameter Integer ntasks "Total number of tasks";  
  parameter SI.Current onCurrents[ntasks] "Array of the on-currents";
  parameter SI.Current offCurrents[ntasks] "Array of the off-currents";
  parameter SI.Time onTimes[ntasks] "Array of the on-times";
  parameter SI.Time delays[ntasks] "Array of the delay times";
  parameter SI.Time periods[ntasks] "Array of the periods";
end template;
