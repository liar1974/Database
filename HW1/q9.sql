SELECT et.name
FROM (SELECT  a.ssn2 ssn3, COUNT(DISTINCT p.model_no) no_count
      FROM (SELECT tl.ssn ssn2
            FROM test_log tl
            WHERE tl.test_date >= TO_DATE('2011-1-1','yyyy-mm-dd') AND tl.ssn IN (SELECT ex.ssn ssn2
                                                                                  FROM expert ex
                                                                                  GROUP BY ex.ssn HAVING COUNT(*) >=2)
            GROUP BY tl.ssn HAVING COUNT(*)>=2) a, test_log tl2, plane p
      WHERE a.ssn2 = tl2.ssn AND tl2.reg_no = p.reg_no AND tl2.test_date >= TO_DATE('2011-1-1','yyyy-mm-dd')
      GROUP BY a.ssn2) b,employee_table et
WHERE b.no_count <> 1 AND et.ssn = b.ssn3;