within EnergyHarvestingWSN.Records.MicroControllers;
record MSP430 "MSP430 Micro Controller"
  extends EnergyHarvestingWSN.Records.MicroControllers.template(c1AM = 0.0963338, c2AM = 0.00816327, c3AM = 0.0100531, c1LPM = 0.25, saveOpTable = [0, 0; 1.7, 0; 1.8, 4.15; 2.2, 7.5; 2.7, 12; 3.3, 16; 4.1, 16; 4.2, 0]);
  annotation(defaultComponentPrefixes = "parameter");
end MSP430;
