CREATE TYPE address_type AS OBJECT(
       street     VARCHAR2(20),
       city       VARCHAR2(20),
       state      VARCHAR2(2),
       zip        NUMBER(5)
);
/
CREATE TYPE employee_type AS OBJECT(
       ssn        NUMBER(9),
       name       VARCHAR2(10),
       DOB        DATE,
       phone_num  NUMBER(10),
       salary     NUMBER(7,2),
       address    address_type
)
NOT FINAL;
/

CREATE TYPE technician_type UNDER employee_type();
/

CREATE TYPE traffic_control_type UNDER employee_type(
       exam_date  DATE
);
/

CREATE TABLE address_table OF address_type;
CREATE TABLE employee_table OF employee_type(
       ssn PRIMARY KEY NOT NULL
);

CREATE TABLE technician_table OF technician_type;
CREATE TABLE traffic_control_table OF traffic_control_type;

CREATE TABLE model(
       model_no   VARCHAR2(10)  PRIMARY KEY NOT NULL,
       capacity   NUMBER(4)     NOT NULL,
       weight     NUMBER(7)     NOT NULL,
       propulsion VARCHAR2(9)   NOT NULL,
       CONSTRAINT model_propulsion_ck CHECK (propulsion IN ('Jet','Propeller'))
);

CREATE TABLE plane(
       reg_no     NUMBER(2)     PRIMARY KEY NOT NULL,
       color      VARCHAR2(15)  NOT NULL,
       model_no   VARCHAR2(5)   NOT NULL
);

CREATE TABLE test(
       FAA_no     NUMBER(1)    PRIMARY KEY NOT NULL,
       title      VARCHAR2(50) NOT NULL,
       max_score  NUMBER(3)    NOT NULL
);

CREATE TABLE expert(
       ssn        NUMBER(9),
       model_no   VARCHAR2(10),
       CONSTRAINT employee_expert_ssn_fk FOREIGN KEY (ssn) REFERENCES employee_table (ssn) ON DELETE CASCADE,
       CONSTRAINT model_expert_model_no_fk FOREIGN KEY (model_no) REFERENCES model (model_no) ON DELETE CASCADE
);

CREATE TABLE test_log(
       ssn        NUMBER(9),
       reg_no     NUMBER(2),
       FAA_no     NUMBER(1),
       test_date  DATE         NOT NULL,
       duration   NUMBER(1)    NOT NULL,
       score      NUMBER(3)    NOT NULL,
       CONSTRAINT employee_test_log_ssn_fk FOREIGN KEY (ssn) REFERENCES employee_table (ssn) ON DELETE CASCADE,
       CONSTRAINT plane_test_log_ssn_fk FOREIGN KEY (reg_no) REFERENCES plane (reg_no) ON DELETE CASCADE,
       CONSTRAINT test_test_log_FAA_no_fk FOREIGN KEY (FAA_no) REFERENCES test (FAA_no) ON DELETE CASCADE
);
INSERT INTO employee_table 
       VALUES(technician_type(123298320,'Keith',TO_DATE('1938-11-8','yyyy-mm-dd'),2132905820,6583.12,address_type('Bison pkwy','Los Angeles','CA',92929)));
INSERT INTO employee_table 
       VALUES(technician_type(372908451,'Kevin',TO_DATE('1981-2-2','yyyy-mm-dd'),233209332,8941.22,address_type('Alton dr','Los Angeles','CA',92931)));
INSERT INTO employee_table 
       VALUES(technician_type(204334892,'Ann',TO_DATE('1949-3-5','yyyy-mm-dd'),2124933389,10381.47,address_type('Adams blvd','Los Angeles','CA',90007)));
INSERT INTO employee_table 
       VALUES(technician_type(299128449,'Carol',TO_DATE('1950-4-8','yyyy-mm-dd'),7479929932,8821.73,address_type('Florence blvd','Houston','TX',79601)));
INSERT INTO employee_table 
       VALUES(technician_type(928283833,'Lynn',TO_DATE('1960-2-8','yyyy-mm-dd'),6862914398,8291.88,address_type('Olympic blvd','Los Angeles','CA',90008)));
INSERT INTO employee_table 
       VALUES(technician_type(824039485,'Brian',TO_DATE('1959-12-1','yyyy-mm-dd'),6525812978,9213.74,address_type('Venice blvd','Houston','TX',79510)));
INSERT INTO employee_table 
       VALUES(technician_type(934893333,'David',TO_DATE('1973-3-19','yyyy-mm-dd'),2183895532,7291.83,address_type('Rodea rd','Los Angeles','CA',90002)));
INSERT INTO employee_table 
       VALUES(technician_type(894999488,'Eric',TO_DATE('1971-10-2','yyyy-mm-dd'),2778948933,7190.32,address_type('Washington blvd','Houston','TX',79619)));
INSERT INTO employee_table 
       VALUES(technician_type(882442944,'George',TO_DATE('1967-8-23','yyyy-mm-dd'),4439935893,7923.85,address_type('Pico rd','Los Angeles','CA',90018)));
INSERT INTO employee_table 
       VALUES(technician_type(339498394,'Jim',TO_DATE('1966-7-8','yyyy-mm-dd'),9458935890,9391.87,address_type('Culver blvd','Los Angeles','CA',90006)));
INSERT INTO employee_table 
       VALUES(traffic_control_type(289832932,'Tina',TO_DATE('1965-6-6','yyyy-mm-dd'),2822833322,9521.3,address_type('8th st','Los Angeles','CA',90017),TO_DATE('2011-1-1','yyyy-mm-dd')));
INSERT INTO employee_table 
       VALUES(traffic_control_type(849338493,'Wendy',TO_DATE('1982-7-31','yyyy-mm-dd'),2818923842,6491.89,address_type('120th st','Los Angeles','CA',90013),TO_DATE('2011-2-1','yyyy-mm-dd')));
INSERT INTO employee_table 
       VALUES(traffic_control_type(832908892,'Scott',TO_DATE('1985-7-23','yyyy-mm-dd'),8923899213,8333.98,address_type('7th st','Los Angeles','CA',90012),TO_DATE('2011-1-28','yyyy-mm-dd')));
INSERT INTO employee_table 
       VALUES(traffic_control_type(899123374,'Roger',TO_DATE('1974-8-18','yyyy-mm-dd'),9984898921,10388.99,address_type('13th st','Los Angeles','CA',90007),TO_DATE('2011-2-5','yyyy-mm-dd')));
INSERT INTO employee_table 
       VALUES(traffic_control_type(192883892,'Paul',TO_DATE('1977-9-28','yyyy-mm-dd'),8398428921,7201.33,address_type('21th st','Los Angeles','CA',90007),TO_DATE('2011-2-11','yyyy-mm-dd')));
INSERT INTO technician_table 
       VALUES(123298320,'Keith',TO_DATE('1938-11-8','yyyy-mm-dd'),2132905820,6583.12,address_type('Bison pkwy','Los Angeles','CA',92929));
INSERT INTO technician_table
       VALUES(372908451,'Kevin',TO_DATE('1981-2-2','yyyy-mm-dd'),233209332,8941.22,address_type('Alton dr','Los Angeles','CA',92931));
INSERT INTO technician_table 
       VALUES(204334892,'Ann',TO_DATE('1949-3-5','yyyy-mm-dd'),2124933389,10381.47,address_type('Adams blvd','Los Angeles','CA',90007));
INSERT INTO technician_table
       VALUES(299128449,'Carol',TO_DATE('1950-4-8','yyyy-mm-dd'),7479929932,8821.73,address_type('Florence blvd','Houston','TX',79601));
INSERT INTO technician_table
       VALUES(928283833,'Lynn',TO_DATE('1960-2-8','yyyy-mm-dd'),6862914398,8291.88,address_type('Olympic blvd','Los Angeles','CA',90008));
INSERT INTO technician_table
       VALUES(824039485,'Brian',TO_DATE('1959-12-1','yyyy-mm-dd'),6525812978,9213.74,address_type('Venice blvd','Houston','TX',79510));
INSERT INTO technician_table
       VALUES(934893333,'David',TO_DATE('1973-3-19','yyyy-mm-dd'),2183895532,7291.83,address_type('Rodea rd','Los Angeles','CA',90002));
INSERT INTO technician_table
       VALUES(894999488,'Eric',TO_DATE('1971-10-2','yyyy-mm-dd'),2778948933,7190.32,address_type('Washington blvd','Houston','TX',79619));
INSERT INTO technician_table
       VALUES(882442944,'George',TO_DATE('1967-8-23','yyyy-mm-dd'),4439935893,7923.85,address_type('Pico rd','Los Angeles','CA',90018));
INSERT INTO technician_table
       VALUES(339498394,'Jim',TO_DATE('1966-7-8','yyyy-mm-dd'),9458935890,9391.87,address_type('Culver blvd','Los Angeles','CA',90006));
INSERT INTO traffic_control_table
       VALUES(289832932,'Tina',TO_DATE('1965-6-6','yyyy-mm-dd'),2822833322,9521.3,address_type('8th st','Los Angeles','CA',90017),TO_DATE('2011-1-1','yyyy-mm-dd'));
INSERT INTO traffic_control_table
       VALUES(849338493,'Wendy',TO_DATE('1982-7-31','yyyy-mm-dd'),2818923842,6491.89,address_type('120th st','Los Angeles','CA',90013),TO_DATE('2011-2-1','yyyy-mm-dd'));
INSERT INTO traffic_control_table
       VALUES(832908892,'Scott',TO_DATE('1985-7-23','yyyy-mm-dd'),8923899213,8333.98,address_type('7th st','Los Angeles','CA',90012),TO_DATE('2011-1-28','yyyy-mm-dd'));
INSERT INTO traffic_control_table
       VALUES(899123374,'Roger',TO_DATE('1974-8-18','yyyy-mm-dd'),9984898921,10388.99,address_type('13th st','Los Angeles','CA',90007),TO_DATE('2011-2-5','yyyy-mm-dd'));
INSERT INTO traffic_control_table
       VALUES(192883892,'Paul',TO_DATE('1977-9-28','yyyy-mm-dd'),8398428921,7201.33,address_type('21th st','Los Angeles','CA',90007),TO_DATE('2011-2-11','yyyy-mm-dd'));

INSERT INTO model(model_no,capacity,weight,propulsion)
       VALUES('747',300,150000,'Jet');
INSERT INTO model(model_no,capacity,weight,propulsion)
       VALUES('757',270,135000,'Jet');
INSERT INTO model(model_no,capacity,weight,propulsion)
       VALUES('767',260,120000,'Jet');
INSERT INTO model(model_no,capacity,weight,propulsion)
       VALUES('777',160,130000,'Jet');
INSERT INTO model(model_no,capacity,weight,propulsion)
       VALUES('787',230,140000,'Jet');
INSERT INTO model(model_no,capacity,weight,propulsion)
       VALUES('RV-7',2,1100,'Propeller');
INSERT INTO model(model_no,capacity,weight,propulsion)
       VALUES('RV-8',2,1200,'Propeller');
INSERT INTO model(model_no,capacity,weight,propulsion)
       VALUES('RV-9',2,1310,'Propeller');
INSERT INTO model(model_no,capacity,weight,propulsion)
       VALUES('RV-10',2,1520,'Propeller');

INSERT INTO plane(reg_no,color,model_no)
       VALUES(1,'white','747');
INSERT INTO plane(reg_no,color,model_no)
       VALUES(2,'green','767');
INSERT INTO plane(reg_no,color,model_no)
       VALUES(3,'blue','777');
INSERT INTO plane(reg_no,color,model_no)
       VALUES(4,'white,blue','767');
INSERT INTO plane(reg_no,color,model_no)
       VALUES(5,'blue','RV-7');
INSERT INTO plane(reg_no,color,model_no)
       VALUES(6,'green','RV-8');
INSERT INTO plane(reg_no,color,model_no)
       VALUES(7,'red,blue','RV-9');
INSERT INTO plane(reg_no,color,model_no)
       VALUES(8,'white','RV-10');
INSERT INTO plane(reg_no,color,model_no)
       VALUES(9,'white','747');
INSERT INTO plane(reg_no,color,model_no)
       VALUES(10,'blue','747');

INSERT INTO test(FAA_no,title,max_score)
       VALUES(1,'A/C Systems',100);
INSERT INTO test(FAA_no,title,max_score)
       VALUES(2,'Pneumatic Systems',50);
INSERT INTO test(FAA_no,title,max_score)
       VALUES(3,'Flight Instruments',100);
INSERT INTO test(FAA_no,title,max_score)
       VALUES(4,'Auto Control Systems',100);
INSERT INTO test(FAA_no,title,max_score)
       VALUES(5,'Ice Protection Systems',100);


INSERT INTO expert(ssn,model_no)
       VALUES(123298320,'747');
INSERT INTO expert(ssn,model_no)
       VALUES(372908451,'747');
INSERT INTO expert(ssn,model_no)
       VALUES(299128449,'747');
INSERT INTO expert(ssn,model_no)
       VALUES(894999488,'747');
INSERT INTO expert(ssn,model_no)
       VALUES(299128449,'767');
INSERT INTO expert(ssn,model_no)
       VALUES(934893333,'767');
INSERT INTO expert(ssn,model_no)
       VALUES(339498394,'767');
INSERT INTO expert(ssn,model_no)
       VALUES(882442944,'767');
INSERT INTO expert(ssn,model_no)
       VALUES(824039485,'777');
INSERT INTO expert(ssn,model_no)
       VALUES(894999488,'787');
INSERT INTO expert(ssn,model_no)
       VALUES(882442944,'787');
INSERT INTO expert(ssn,model_no)
       VALUES(894999488,'RV-7');
INSERT INTO expert(ssn,model_no)
       VALUES(299128449,'RV-8');
INSERT INTO expert(ssn,model_no)
       VALUES(204334892,'RV-9');
INSERT INTO expert(ssn,model_no)
       VALUES(928283833,'RV-10');

INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(123298320,1,1,TO_DATE('2011-1-22','yyyy-mm-dd'),1,100);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(372908451,1,2,TO_DATE('2011-1-12','yyyy-mm-dd'),2,50);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(299128449,1,3,TO_DATE('2011-1-31','yyyy-mm-dd'),1,90);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(894999488,1,4,TO_DATE('2011-1-8','yyyy-mm-dd'),3,100);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(299128449,1,5,TO_DATE('2010-12-8','yyyy-mm-dd'),2,100);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(934893333,2,1,TO_DATE('2011-1-9','yyyy-mm-dd'),5,90);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(299128449,2,2,TO_DATE('2011-1-11','yyyy-mm-dd'),2,50);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(934893333,2,3,TO_DATE('2011-1-13','yyyy-mm-dd'),3,90);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(339498394,2,4,TO_DATE('2011-1-14','yyyy-mm-dd'),3,100);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(882442944,2,5,TO_DATE('2011-1-21','yyyy-mm-dd'),2,85);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(824039485,3,2,TO_DATE('2010-12-31','yyyy-mm-dd'),1,50);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(824039485,3,3,TO_DATE('2010-12-22','yyyy-mm-dd'),2,80);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(882442944,4,3,TO_DATE('2011-2-1','yyyy-mm-dd'),3,100);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(894999488,5,4,TO_DATE('2011-1-11','yyyy-mm-dd'),3,95);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(299128449,6,3,TO_DATE('2011-1-13','yyyy-mm-dd'),1,100);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(204334892,7,5,TO_DATE('2011-1-28','yyyy-mm-dd'),1,95);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(928283833,8,5,TO_DATE('2010-12-30','yyyy-mm-dd'),2,100);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(372908451,9,4,TO_DATE('2010-12-22','yyyy-mm-dd'),2,50);
INSERT INTO test_log(ssn,reg_no,FAA_no,test_date,duration,score)
       VALUES(123298320,10,2,TO_DATE('2010-12-25','yyyy-mm-dd'),2,50);