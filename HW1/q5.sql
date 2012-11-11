SELECT m.model_no No_expert
FROM model m
WHERE m.model_no NOT IN (SELECT ex.model_no
                        FROM expert ex
                        );