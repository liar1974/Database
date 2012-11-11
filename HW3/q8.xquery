<rows>
{
for $hotelName in distinct-values(doc("conference.xml")/conferences/conference/hotel_chain_name)
let $conference := doc("conference.xml")/conferences/conference[hotel_chain_name=$hotelName]
order by count($conference) descending
return 
	<row>
	    <name>{$hotelName}</name>
	    <number-of-conferences>{count($conference)}</number-of-conferences>
	</row>
}</rows>
