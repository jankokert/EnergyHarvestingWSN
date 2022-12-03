within EnergyHarvestingWSN.EnergyLoads;
model PeriodicCurrent
  extends EnergyHarvestingWSN.Icons.Sink;
  extends EnergyHarvestingWSN.Interfaces.Sink;
  extends EnergyHarvestingWSN.Interfaces.ConditionalPeriodPort;
  import SI = Modelica.Units.SI;
    
  parameter SI.Current onCurrent = 0.1;
  parameter SI.Current offCurrent = 0;
  parameter SI.Time onTime = 0.1;
  parameter SI.Time delay = 0.0;
  parameter SI.Voltage vcalc = 3.0 "the actual input current is based on this voltage";

  SI.Current ireal;
  SI.Conductance G;
  SI.Energy Econs;

protected
  discrete SI.Time nextOn, T0;


initial equation
  // "time" is needed if simulation is started at t!=0
  // 1x period is added for a proper start of other models
  nextOn = time + period + delay;
  T0 = nextOn;
  Econs = 0;


algorithm
  assert(period > 0, "Period is zero - no events will be triggered!", AssertionLevel.warning);
    
  when time > nextOn then
    T0 := time;
    nextOn := time + period;
  end when;

equation
  ireal = 
    if time < T0 then
      offCurrent
    else if time < T0 + onTime then
      onCurrent
    else
      offCurrent
    ;
  
  G = ireal / vcalc;
  Iin = G * Vout;

  der(Econs) = Vout * Iin;
     
  annotation(
    defaultComponentName = "task",
    Icon(coordinateSystem(preserveAspectRatio = false, grid = {1, 1}, initialScale = 0.1), graphics = {Text(origin = {75, 0}, rotation = -90, lineColor = {0, 0, 255}, extent = {{-80, -15}, {80, 15}}, textString = "%name")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end PeriodicCurrent;
