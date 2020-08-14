/*---------------------------
 distance_service_funcs_test.p
 ----------------------------------*/
 
using OpenEdge.Core.Assert.

block-level on error undo, throw.

{tables.i}
{city_service_funcs.i}

@Setup.
procedure setup:
    empty temp-table ttCityGeo.
    empty temp-table ttCityPair.
    
    // clear error-status
    "a" = "a" no-error.
end procedure.

@Test.
procedure loadDataTest:
    run loadData.
    
    define variable cntRecords as integer no-undo init 0.
    
    for each ttCityGeo:
        cntRecords = cntRecords + 1.
    end.
    
    Assert:Equals(9, cntRecords).
end procedure.

//N.B. this test will be failing initially! 
@Test.
procedure thereAreThreeCombinationsOfThreeCities:
    define variable vaCities as character initial "Birmingham,Boise,Honolulu".
    define variable cntRecords as integer no-undo init 0.
    
    create ttCityGeo.
    ttCityGeo.city-name = "Birmingham".
    create ttCityGeo.
    ttCityGeo.city-name = "Boise".
    create ttCityGeo.
    ttCityGeo.city-name = "Honolulu".

    run createCityPairs(vaCities).
    
    for each ttCityPair:
        cntRecords = cntRecords + 1.
    end.
    
    //TODO: better would be to specify the pairs and match them specifically
    // but minimally n choose k is 3 for n = 3 and k = 2
    Assert:Equals( 3, cntRecords ).
     
    
end procedure.

// N.B. this will be failing initially until 
// you implement
@Test.
procedure errorRaisedWhenCityNotFoundInGeo: 
    create ttCityGeo.
    ttCityGeo.city-name = "Birmingham".
    create ttCityGeo.
    ttCityGeo.city-name = "Boise".
    create ttCityGeo.
    ttCityGeo.city-name = "Honolulu".
    
    run validateCommandline( "Boise,NotFound" ) no-error.
    
    Assert:IsTrue(error-status:error).    
end procedure.



// feel free to add more tests
