/* tables.i */

define temp-table ttCityGeo
    field city-name as character
    field latitude as decimal
    field longitude as decimal
    field provstate as character
    field country as character
    
    index idxCity is primary city-name ascending.
    
define temp-table ttCityPair
    field city-name1 as character
    field latitude1 as decimal
    field longitude1 as decimal
    field city-name2 as character
    field latitude2 as decimal
    field longitude2 as decimal
    
    index idxCity is primary city-name1 ascending.