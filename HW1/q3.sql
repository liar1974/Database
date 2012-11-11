SELECT p.reg_no registration_no, m.capacity max_capacity
FROM plane p, model m
WHERE p.model_no = m.model_no;