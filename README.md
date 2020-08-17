You are provided a list of cities and their latitude and longitudes as data for your program.
These are in latlong.csv
The file is comma-delimited, its first row is headers
The columns are:
City, Latitude, Longitude, State/Province, Country
This template project includes code to load the data for you.

Add your code to city_service_funcs.i and city_service_funcs_test.p.
Write code that validates the input data in the format 'a,b,c' against the loaded city data in the procedure <code>validateCommandline</code>.
Write code that accepts a list of city names and using the provided data in ttCityGeo to populate the temp-table ttCityPairs with all combinations of cities in procedure <code>createCityPairs</code>.

1. Combinations are not permutations, so the pair (a1,b1) is the same as (b1,a1), and (a1,a1) is not a valid combination.

2.  It is an error if, for example, a provided city name does not exist in the lat long list.  In this case signal an error.  This may not be the only possible error.

3.  If you can write unit tests with ABL Unit please include them in your submission!  

You can download a trial of the classroom edition of Progress Developer Studio from:
[https://www.progress.com/trial-openedge]

PDSOE is based on Eclipse, so to import:
- File | Import...
- Expand Git and choose Projects from git
- Then Clone URI
- For Wizard leave it at "Import existing Eclipse projects"

**SUBMIT COMPLETED CODE BY EMAIL TO Devgroupssnc@ifdsgroup.com AS AN ATTACHED ZIP WITHOUT BINARIES.**
**PLEASE NOTE YOUR FULL NAME IN THE BODY OF THE EMAIL.**
