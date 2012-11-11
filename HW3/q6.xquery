<rows>
{
for $conName in distinct-values(doc("participation.xml")/participationInfo/individualParticipation/conferenceName)
for $year in distinct-values(doc("participation.xml")/participationInfo/individualParticipation/conferenceYear)
let $no := doc("participation.xml")/participationInfo/individualParticipation[conferenceName=$conName and conferenceYear=$year]
let $topic := distinct-values(doc("conference.xml")/conferences/conference[conference_name=$conName]/topic)
return 
	<row>
	    <name>{$conName}</name>
	    <year>{$year}</year>
	    <topic>{string($topic)}</topic>
	    <number-of-attendees>{count($no)}</number-of-attendees>
	</row>
}</rows>