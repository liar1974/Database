<rows>
{
for $SSN in distinct-values(doc("participation.xml")/participationInfo/individualParticipation/studentSSN)
for $year in distinct-values(doc("participation.xml")/participationInfo/individualParticipation/conferenceYear)
let $institution := doc("student.xml")/students/student[SSN=$SSN]/institutionName
let $fee := doc("participation.xml")/participationInfo/individualParticipation[studentSSN=$SSN and conferenceYear=$year]/registrationFee
order by $SSN ascending, $fee descending
return 
	<row>
	    <SSN>{$SSN}</SSN>
	    <institution>{string($institution)}</institution>
	    <year>{$year}</year>
	    <total-fee>{sum($fee)}</total-fee>
	</row>
}</rows>