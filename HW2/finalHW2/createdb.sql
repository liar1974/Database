CREATE TABLE animals
(
	animal_id		NUMBER(3)       PRIMARY KEY NOT NULL ,
	animal_name		VARCHAR(15)	NOT NULL ,
	shape SDO_GEOMETRY
) ;

CREATE TABLE trucks
(
	truck_id		NUMBER(3)       PRIMARY KEY NOT NULL ,
	truck_name		VARCHAR(8)	NOT NULL ,
        shape SDO_GEOMETRY,
	id_vaccines     VARCHAR(40)     NOT NULL
) ;


INSERT INTO USER_SDO_GEOM_METADATA VALUES ('animals', 'shape', SDO_DIM_ARRAY(
							SDO_DIM_ELEMENT('X', 0, 450, 0.005),
							SDO_DIM_ELEMENT('Y', 0, 300, 0.005)
							), NULL);

INSERT INTO USER_SDO_GEOM_METADATA VALUES ('trucks', 'shape', SDO_DIM_ARRAY(
							SDO_DIM_ELEMENT('X', 0, 450, 0.005),
							SDO_DIM_ELEMENT('Y', 0, 300, 0.005)
							), NULL);
CREATE TABLE vaccines
(
	vaccine_id		VARCHAR(4)      PRIMARY KEY NOT NULL ,
	vaccine_name		VARCHAR(20)	NOT NULL ,
	animal_name     VARCHAR(40)     NOT NULL
) ;

CREATE INDEX animals_spatial_idx
			ON animals(shape)
			INDEXTYPE IS MDSYS.SPATIAL_INDEX;
			
CREATE INDEX trucks_spatial_idx
			ON trucks(shape)
			INDEXTYPE IS MDSYS.SPATIAL_INDEX;
