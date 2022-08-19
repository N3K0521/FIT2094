/*
Databases Session 6 Q&A
drone_schema_start.sql

Databases Units
Author: FIT Database Teaching Team
License: Copyright � Monash University, unless otherwise stated. All Rights Reserved.
COPYRIGHT WARNING
Warning
This material is protected by copyright. For use within Monash University only. NOT FOR RESALE.
Do not remove this notice. 
*/

/* print SQL command before the output*/
SET ECHO ON

/* drop all tables*/
DROP TABLE customer CASCADE CONSTRAINTS PURGE;

DROP TABLE cust_train CASCADE CONSTRAINTS PURGE;

DROP TABLE drone CASCADE CONSTRAINTS PURGE;

DROP TABLE rental CASCADE CONSTRAINTS PURGE;

DROP TABLE training_course CASCADE CONSTRAINTS PURGE;

/* Purple tables on slide 32*/
CREATE TABLE drone (
    drone_id           NUMBER(5) NOT NULL,
    drone_pur_date     DATE NOT NULL,
    drone_pur_price    NUMBER(7, 2) NOT NULL,
    drone_flight_time  NUMBER(6, 1) NOT NULL,
    drone_cost_hr      NUMBER(6, 2) NOT NULL,
    dt_code            CHAR(4) NOT NULL
);

COMMENT ON COLUMN drone.drone_id IS
    'drone id (unique for each drone)';

COMMENT ON COLUMN drone.drone_pur_date IS
    'drone purchase date';

COMMENT ON COLUMN drone.drone_pur_price IS
    'drone purchase price';

COMMENT ON COLUMN drone.drone_flight_time IS
    'drone flight time completed since purchase';

COMMENT ON COLUMN drone.drone_cost_hr IS
    'drone rate per hour';

COMMENT ON COLUMN drone.dt_code IS
    'drone type code';

ALTER TABLE drone ADD CONSTRAINT drone_pk PRIMARY KEY ( drone_id );


CREATE TABLE training_course (
    train_code        CHAR(5) NOT NULL,
    traincourse_date  DATE NOT NULL,
    trainer_id        NUMBER(3) NOT NULL
);

COMMENT ON COLUMN training_course.train_code IS
    'training code (unique for each training)';

COMMENT ON COLUMN training_course.traincourse_date IS
    'training course date';

COMMENT ON COLUMN training_course.trainer_id IS
    'trainer unique id';

ALTER TABLE training_course ADD CONSTRAINT training_course_pk PRIMARY KEY ( train_code,
                                                                            traincourse_date );
/* Student work starts here:*/