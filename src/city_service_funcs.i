/*------------------------------------------------------------------------
    city_service_funcs.i
  ----------------------------------------------------------------------*/
  
  
/*
   populate the temp-table ttCityPair with all combinations
   of the provided cities.
*/
procedure createCityPairs:
    define input parameter pCityNames as character no-undo.

    //TODO: implement this, feel free to create
    //     other functions/procedures if you need
        
end procedure.  

/* 
  make sure we have at least two cities and
  all of them are in our GeoList
*/
procedure validateCommandline:
    define input parameter pCityNames as character.
    
    //TODO: validate input in the form 'a,b,c' 
    //      against ttCityGeo
    
end procedure.

/* populate ttCityGeo */
procedure loadData:
  define variable acRow as character extent 5 no-undo.
  define variable idx as integer init 1.
    
    input from "latlong.csv".
    
    repeat:
        if idx > 1 then do:
            create ttCityGeo.
            import delimiter "," ttCityGeo.
        end.
        else do:
            import delimiter ',' acRow.
        end.
        idx = idx + 1.
    end.
    
    input close.
end procedure.

/* print the contents of ttCityPair */
procedure printResult:
    for each ttCityPair:
        display ttCityPair.
    end.
end procedure.

        