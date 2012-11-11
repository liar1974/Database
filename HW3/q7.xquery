<rows>
{
for $conName in distinct-values(doc("participation.xml")/participationInfo/individualParticipation/conferenceName)
for $year in distinct-values(doc("participation.xml")/participationInfo/individualParticipation/conferenceYear)
let $no := doc("participation.xml")/participationInfo/individualParticipation[conferenceName=$conName and conferenceYear=$year]
let $fee := doc("participation.xml")/participationInfo/individualParticipation[conferenceName=$conName and conferenceYear=$year]/registrationFee
let $chairName := doc("conference.xml")/conferences/conference[conference_name=$conName and year=$year]
return 
	<row>
	    <chair-names>{string-join(data($chairName/chair_name), ", ")}</chair-names>
	    <name>{$conName}</name>
	    <year>{$year}</year>
        <no>{count($no)}</no>
        <fee>{sum($fee)}</fee>
	</row>
}</rows>