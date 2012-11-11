<rows>
{
for $conName in distinct-values(doc("participation.xml")/participationInfo/individualParticipation/conferenceName)
for $year in distinct-values(doc("participation.xml")/participationInfo/individualParticipation/conferenceYear)
let $no := doc("participation.xml")/participationInfo/individualParticipation[conferenceName=$conName and conferenceYear=$year]/studentSSN
let $age := doc("student.xml")/students/student[SSN=$no]/age
order by avg($age) descending
return 
	<row>
	    <name>{$conName}</name>
	    <year>{$year}</year>
	    <average-age>{avg($age)}</average-age>
	</row>
}</rows>