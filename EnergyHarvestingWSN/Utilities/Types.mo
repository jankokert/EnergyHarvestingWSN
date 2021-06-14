within EnergyHarvestingWSN.Utilities;
package Types
type EnergyMode = enumeration(
      AM "Active mode",
      LEM0 "Low energy mode 0",
      LEM1 "Low energy mode 1",
      LEM2 "Low energy mode 2",
      LEM3 "Low energy mode 3",
      LEM4 "Low energy mode 4");

type DataSource = enumeration(
      Parameter "Use parameter",
      Input "Use input connector") "Enumeration to define data source";

end Types;
