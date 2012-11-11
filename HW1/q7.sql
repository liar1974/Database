SELECT ROWNUM, t2.FAA_no,t2.title
FROM test t2,(SELECT tl.FAA_no FAA_no,COUNT(*) no_reaching
              FROM test_log tl,test t
              WHERE tl.score=t.max_score AND tl.FAA_no = t.FAA_no
              GROUP BY tl.FAA_no
              ORDER BY no_reaching DESC) nt
WHERE t2.FAA_no = nt.FAA_no AND ROWNUM =1;