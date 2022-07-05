.mode csv
.import "SA Flora Sample.csv" flora
.headers on

/* Create day, month, year columns using 30 as the toggle year for century.
   Append '0' to single digit day and month.
*/

create table tmp as
select *,case substr(sightingdate,length(sightingdate)-4,1)
           when '/' then
               '0'||substr(sightingdate,length(sightingdate)-3,1)
           else 
               substr(sightingdate,length(sightingdate)-4,2)
       end as month,
       case 
            when substr(sightingdate,length(sightingdate)-1,2) < '30' then
                '20'||substr(sightingdate,length(sightingdate)-1,2)
            else
                '19'||substr(sightingdate,length(sightingdate)-1,2)
       end as year,
       case 
            when substr(sightingdate,2,1) = '/' then
                '0'||substr(sightingdate,1,1)
            else
                substr(sightingdate,1,2)
       end as day
from flora;

/* Change sightingdate to eventDate in ISO-8601 format, rename observer to recordedByID.
   Discard NSXCODE.
 */

CREATE TABLE flora2 AS
SELECT KEY, FLORACODE, SOURCE, SURVEYNAME,
       year||'-'||month||'-'||day AS eventDate, DATEACCURACY, OBSERVER AS recordedBYID, NUMOBSERVED,
       MUSEUMHERBMNR, RELIABDESC, AMGZONE, EASTING,
       NORTHING, LATITUDE, LONGITUDE, SPRELIABCODE,
       SPECIES, FAMILYNAME, COMNAME1,
       SIGHTINGCOMM, HABITATCOMM, LOCATIONCOMM, RESERVENAME,
       ISINDIGENOUSFLAG
FROM tmp;

.mode csv
.output flora_reformatted.csv
SELECT *
FROM flora2;
.quit