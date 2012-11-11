<rows>
{
for $zip in distinct-values (doc("hotel.xml")/hotels/hotel/address/zip)
let $capacity := doc("hotel.xml")/hotels/hotel[address/zip=$zip]/capacity
let $hotelNo := doc("hotel.xml")/hotels/hotel[address/zip=$zip]
order by sum($capacity) descending
return 
	<row>
	    <zip-code>{$zip}</zip-code>
		<number-of-hotels>{count($hotelNo)}</number-of-hotels>
		<capacity>{sum($capacity)}</capacity>
	</row>
}
</rows>

