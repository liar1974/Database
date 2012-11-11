SELECT b.mn2 model_no, et2.name name
FROM employee_table et2,(SELECT ex2.model_no mn2,MIN(et.DOB) oldest
                         FROM expert ex2,employee_table et,(SELECT ex.model_no mn
                                                            FROM expert ex
                                                            GROUP BY ex.model_no HAVING COUNT(*)>=2) a
                         WHERE a.mn = ex2.model_no AND ex2.ssn = et.ssn
                         GROUP BY ex2.model_no) b
WHERE b.oldest = et2.DOB;