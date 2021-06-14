within EnergyHarvestingWSN.EnergyHarvester.TEG;
model linHarv
  extends Icons.SolarCell;
  import SI = Modelica.Units.SI;
  Modelica.Electrical.Analog.Interfaces.NegativePin pout annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {100.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin nout annotation(Placement(visible = true, transformation(origin = {100, -20}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {100.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput temperature(final quantity="Irradiance",
      final unit="W/m2") "diff. input temperature" annotation (Placement(
      visible=true,
      transformation(
        origin={-100,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={-90.0,0.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  //  EnergyHarvestingWSN.Utilities.Resistor resistorSerial(R = cellparam.Rs / A) annotation(Placement(transformation(extent = {{60, 10}, {80, 30}})));
  EnergyHarvestingWSN.Utilities.Resistor resistorSerial(R = 1) annotation(Placement(transformation(extent = {{60, 10}, {80, 30}})));
  //parameter EnergyHarvestingWSN.Records.SolarCells.template cellparam annotation(__Dymola_choicesAllMatching = true, Placement(transformation(extent = {{-100, 80}, {-80, 100}})));

  output SI.Power Pout;
  Modelica.Electrical.Analog.Sources.SignalVoltage VTEG annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-40,0})));
equation
  VTEG.v = temperature * 0.001;
  Pout = -(pout.v-nout.v)*pout.i;
  connect(resistorSerial.n, pout) annotation(Line(points = {{80, 20}, {100, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(VTEG.n, nout) annotation (Line(
      points={{-40,-10},{-40,-20},{100,-20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(VTEG.p, resistorSerial.p) annotation (Line(
      points={{-40,10},{-40,20},{60,20}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}}),                                                                           graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end linHarv;
