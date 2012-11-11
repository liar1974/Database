SELECT tct.name name
FROM traffic_control_table tct
WHERE tct.salary > (SELECT MAX(tt.salary)
                    FROM technician_table tt
                    WHERE tt.address.state ='CA');