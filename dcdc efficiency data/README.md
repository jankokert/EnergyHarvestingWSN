# Readme
Efficiency data is taken from the original datasheet as screenshot (PNG) and then processed using:
https://automeris.io/WebPlotDigitizer/.

## Filenames
The filenames follow this scheme

    <Vin>_<Iin>___<Vout>_<Iout>

- If the value is constant, then we write it down using `V` and `A` as comma
- If the value is swept, then we write down the symbol.
- If the value needs to be calculated from the other values, then write `eff` instead.
- If there are multiple values within one graph, then we write it as a list using `[1V1,2V2]`.


## Example
    [2V1,3V6,5V5]_eff___1V8_Iout

**Vin:** List of voltages: 2.1V, 3.6V and 5.5V  
**Iin:** Not visible in the graph and must be calculated from the efficiency  
**Vout:** 1.8V  
**Iout:** Is swept (x-axis to the left)

