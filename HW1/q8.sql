SELECT COUNT(*) no_of_plane
FROM (SELECT tl.reg_no 
     FROM test_log tl
     WHERE tl.test_date >= TO_DATE('2011-1-1','yyyy-mm-dd')
     GROUP BY tl.reg_no HAVING COUNT(DISTINCT tl.FAA_no) = 5);