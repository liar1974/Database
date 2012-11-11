SELECT et.name,et.address
FROM employee_table et
WHERE (sysdate-et.DOB)/365 >=50;