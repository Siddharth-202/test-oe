/*------------------------------------------------------------------------
    city_service_funcs.i
  ----------------------------------------------------------------------*/
  
  
/*
   populate the temp-table ttCityPair with all combinations
   of the provided cities.

  */{tables.i}
DEFINE VARIABLE i AS INTEGER  INIT 1   NO-UNDO.  
procedure createCityPairs:
    DEFINE BUFFER bttCityGeo FOR ttCityGeo.
    define input parameter pCityNames as character no-undo.
    DO WHILE i <= NUM-ENTRIES(pCityNames):
      
       FIND FIRST ttCityGeo WHERE city-name <> ENTRY(i,pCityNames) NO-ERROR.
       IF AVAILABLE ttCityGeo THEN
          CREATE ttCityPair.
          ASSIGN
             city-name1 =  ttCityGeo.city-name 
             latitude1  =  ttCityGeo.latitude  
             longitude1 =  ttCityGeo.longitude. 
       FIND FIRST bttCityGeo WHERE bttCityGeo.city-name = ENTRY(i,pCityNames) NO-ERROR.
       IF AVAILABLE bttCityGeo THEN
          ASSIGN   
             city-name2 = bttCityGeo.city-name  
             latitude2  = bttCityGeo.latitude   
             longitude2 = bttCityGeo.longitude. 

        i = i + 1.
      
      
    END.

/*     //TODO: implement this, feel free to create   */
/*     //     other functions/procedures if you need */

        
end procedure.  

/* 
  make sure we have at least two cities and
  all of them are in our GeoList
*/
procedure validateCommandline:
    define input parameter pCityNames as character.
    
/*     //TODO: validate input in the form 'a,b,c' */
/*     //      against ttCityGeo                  */
    DEFINE VARIABLE vcityname AS CHARACTER  EXTENT 10  NO-UNDO.
    FOR EACH ttCityGeo 
        WHERE city-name NE "" BY city-name:
       vcityname[i] = ttCityGeo.city-name.
       i = i + 1.
    END.

    i = 1.

    DO WHILE i <= NUM-ENTRIES(pCityNames):
      IF NOT vcityname[i] = ENTRY(i,pCityNames) THEN DO:
          MESSAGE i vcityname[i] SKIP ENTRY(i,pCityNames) 
              VIEW-AS ALERT-BOX INFO BUTTONS OK.
          MESSAGE "Record is not in form of a,b,c"
              VIEW-AS ALERT-BOX INFO BUTTONS OK.
        i = i + 1.
       NEXT.
       END.
    END.
    
end procedure.

/* populate ttCityGeo */
procedure loadData:
  define variable acRow as character extent 5 no-undo.
  define variable idx as integer init 1.
    
    input from "E:\Python\ML\latlong.csv".
    
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

