<rows>
{
for $student in doc("student.xml")/students/student
let $firstName := $student/student_name/first_name
let $lastName := $student/student_name/last_name
order by string($lastName) ascending
return 
	<row>
	    <first-name>{string($firstName)}</first-name>
	    <last-name>{string($lastName)}</last-name>
	    <email>{string-join(data($student/email), ", ")}</email>
	</row>
}</rows>


