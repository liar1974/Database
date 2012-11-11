SELECT e.name technician
FROM employee_table e
WHERE e.ssn =(SELECT ex.ssn
              FROM expert ex
              WHERE ex.model_no = '777');