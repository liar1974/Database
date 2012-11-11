<kml>
<Folder>
<name>Hotel</name>
<open>1</open>
{
for $hotel in doc("hotel.xml")/hotels/hotel
let $latitude := $hotel/latitude
let $longitude := $hotel/longitude
return
  <Placemark>
   <name>{string($hotel/hotel_chain)},{string($hotel/hotel_branch_name)}</name>
   <Point>
   <coordinates>{string($longitude)},{string($latitude)},0</coordinates>
   </Point>
  </Placemark>
}
</Folder>
</kml>