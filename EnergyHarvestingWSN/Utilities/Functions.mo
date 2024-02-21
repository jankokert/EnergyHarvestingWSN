within EnergyHarvestingWSN.Utilities;
package Functions
  extends Modelica.Icons.Package;
  
  /* This is a copy from Modelica.Electrical.Analog.Semiconductors
   * The import was not possible because the functions are protected there */
  
  function exlin "Exponential function linearly continued for x > Maxexp"
    extends Modelica.Icons.Function;
    input Real x;
    input Real Maxexp;
    output Real z;
  algorithm
    z := if x > Maxexp then exp(Maxexp)*(1 + x - Maxexp) else exp(x);
  end exlin;

  function exlin2 "Exponential function linearly continued for x < MinExp and x > Maxexp"
    extends Modelica.Icons.Function;
    input Real x;
    input Real Minexp;
    input Real Maxexp;
    output Real z;
  algorithm
    z := if x < Minexp then exp(Minexp)*(1 + x - Minexp) else exlin(x, Maxexp);
  end exlin2;
end Functions;
