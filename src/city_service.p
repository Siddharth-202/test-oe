/*------------------------------------------------------------------------
    city_service.p
    
    start with -param "city1,city2,city3"
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

{tables.i}
{city_service_funcs.i}

define variable paCityNames as character no-undo.

run validateCommandline(session:parameter).

run createCityCombinations(session:parameter).

run printResult.




