-- Database Teaching Team
-- Assignment 2A 2022 Summer Semester B
-- Olympic Logistics Services partial schema and insert
-- This script must not be altered in ANY WAY

--Full drop

DROP TABLE country CASCADE CONSTRAINTS;

DROP TABLE driver CASCADE CONSTRAINTS;

DROP TABLE driver_language CASCADE CONSTRAINTS;

DROP TABLE ioc_role CASCADE CONSTRAINTS;

DROP TABLE language CASCADE CONSTRAINTS;

DROP TABLE location CASCADE CONSTRAINTS;

DROP TABLE location_type CASCADE CONSTRAINTS;

DROP TABLE official CASCADE CONSTRAINTS;

DROP TABLE trip CASCADE CONSTRAINTS;

DROP TABLE vehicle CASCADE CONSTRAINTS;

-- Initial Schema

CREATE TABLE country (
    country_ioc_code  CHAR(3) NOT NULL,
    country_ioc_name  VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN country.country_ioc_code IS
    'Country IOC code';

COMMENT ON COLUMN country.country_ioc_name IS
    'Country IOC name';

ALTER TABLE country ADD CONSTRAINT country_pk PRIMARY KEY ( country_ioc_code );

CREATE TABLE ioc_role (
    ioc_role_code  CHAR(2) NOT NULL,
    ioc_role_desc  VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN ioc_role.ioc_role_code IS
    'IOC Role Code';

COMMENT ON COLUMN ioc_role.ioc_role_desc IS
    'IOC role description';

ALTER TABLE ioc_role ADD CONSTRAINT ioc_role_pk PRIMARY KEY ( ioc_role_code );

CREATE TABLE language (
    lang_iso_code  CHAR(2) NOT NULL,
    lang_name      VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN language.lang_iso_code IS
    'Language ISO code';

COMMENT ON COLUMN language.lang_name IS
    'Language name';

ALTER TABLE language ADD CONSTRAINT language_pk PRIMARY KEY ( lang_iso_code );

CREATE TABLE location (
    location_id      NUMBER(6) NOT NULL,
    location_name    VARCHAR2(40),
    location_street  VARCHAR2(50) NOT NULL,
    location_town    VARCHAR2(30) NOT NULL,
    loctype_id       NUMBER(3) NOT NULL
);

COMMENT ON COLUMN location.location_id IS
    'Location id as PK';

COMMENT ON COLUMN location.location_name IS
    'Location name';

COMMENT ON COLUMN location.location_street IS
    'Location street';

COMMENT ON COLUMN location.location_town IS
    'Location town';

COMMENT ON COLUMN location.loctype_id IS
    'Location type id as PK';

ALTER TABLE location ADD CONSTRAINT location_pk PRIMARY KEY ( location_id );

CREATE TABLE location_type (
    loctype_id    NUMBER(3) NOT NULL,
    loctype_desc  VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN location_type.loctype_id IS
    'Location type id as PK';

COMMENT ON COLUMN location_type.loctype_desc IS
    'Location type description';

ALTER TABLE location_type ADD CONSTRAINT location_type_pk PRIMARY KEY ( loctype_id );

CREATE TABLE official (
    off_olympic_id    CHAR(8) NOT NULL,
    off_givenname     VARCHAR2(50) NOT NULL,
    off_familyname    VARCHAR2(50) NOT NULL,
    ioc_role_code     CHAR(2) NOT NULL,
    country_ioc_code  CHAR(3) NOT NULL,
    lang_iso_code     CHAR(2) NOT NULL
);

COMMENT ON COLUMN official.off_olympic_id IS
    'Official olympic id';

COMMENT ON COLUMN official.off_givenname IS
    'Official olypic given name';

COMMENT ON COLUMN official.off_familyname IS
    'Official family name';

COMMENT ON COLUMN official.ioc_role_code IS
    'IOC Role Code';

COMMENT ON COLUMN official.country_ioc_code IS
    'Country IOC code';

COMMENT ON COLUMN official.lang_iso_code IS
    'Language ISO code';

ALTER TABLE official ADD CONSTRAINT official_pk PRIMARY KEY ( off_olympic_id );


CREATE TABLE vehicle (
    veh_vin             CHAR(17) NOT NULL,
    veh_regonumber      CHAR(7) NOT NULL,
    veh_make            VARCHAR2(40) NOT NULL,
    veh_model           VARCHAR2(40) NOT NULL,
    veh_colour          VARCHAR2(20) NOT NULL,
    veh_seatsavailable  NUMBER(2) NOT NULL
);

COMMENT ON COLUMN vehicle.veh_vin IS
    'Vehicle identification number as PK';

COMMENT ON COLUMN vehicle.veh_regonumber IS
    'Vehicle registration number';

COMMENT ON COLUMN vehicle.veh_make IS
    'Vehicle make';

COMMENT ON COLUMN vehicle.veh_model IS
    'Vehicle model';

COMMENT ON COLUMN vehicle.veh_colour IS
    'Vehicle colour';

COMMENT ON COLUMN vehicle.veh_seatsavailable IS
    'Vehicle seats available';

ALTER TABLE vehicle ADD CONSTRAINT vehicle_pk PRIMARY KEY ( veh_vin );

ALTER TABLE vehicle ADD CONSTRAINT vehicle_alt_key UNIQUE ( veh_regonumber );

ALTER TABLE official
    ADD CONSTRAINT country_official_fk FOREIGN KEY ( country_ioc_code )
        REFERENCES country ( country_ioc_code );

ALTER TABLE official
    ADD CONSTRAINT ioc_role_official_fk FOREIGN KEY ( ioc_role_code )
        REFERENCES ioc_role ( ioc_role_code );

ALTER TABLE official
    ADD CONSTRAINT language_official_fk FOREIGN KEY ( lang_iso_code )
        REFERENCES language ( lang_iso_code );

ALTER TABLE location
    ADD CONSTRAINT location_type_location_fk FOREIGN KEY ( loctype_id )
        REFERENCES location_type ( loctype_id );

-- =======================================
-- COUNTRY 
-- =======================================
INSERT INTO COUNTRY VALUES ('ARG','Argentina');
INSERT INTO COUNTRY VALUES ('AUS','Australia');
INSERT INTO COUNTRY VALUES ('BEL','Belgium');
INSERT INTO COUNTRY VALUES ('BLR','Belarus');
INSERT INTO COUNTRY VALUES ('BRA','Brazil');
INSERT INTO COUNTRY VALUES ('CAN','Canada');
INSERT INTO COUNTRY VALUES ('CHN','China');
INSERT INTO COUNTRY VALUES ('DEN','Denmark');
INSERT INTO COUNTRY VALUES ('EGY','Egypt');
INSERT INTO COUNTRY VALUES ('ESP','Spain');
INSERT INTO COUNTRY VALUES ('FRA','France');
INSERT INTO COUNTRY VALUES ('GBR','Great Britain');
INSERT INTO COUNTRY VALUES ('GER','Germany');
INSERT INTO COUNTRY VALUES ('INA','Indonesia');
INSERT INTO COUNTRY VALUES ('IND','India');
INSERT INTO COUNTRY VALUES ('IRI','Iran');
INSERT INTO COUNTRY VALUES ('ITA','Italy');
INSERT INTO COUNTRY VALUES ('JPN','Japan');
INSERT INTO COUNTRY VALUES ('KSA','Saudi Arabia');
INSERT INTO COUNTRY VALUES ('MAS','Malaysia');
INSERT INTO COUNTRY VALUES ('NED','Netherlands');
INSERT INTO COUNTRY VALUES ('NZL','New Zealands');
INSERT INTO COUNTRY VALUES ('POR','Portugal');
INSERT INTO COUNTRY VALUES ('QAT','Qatar');
INSERT INTO COUNTRY VALUES ('RSA','South Africa');
INSERT INTO COUNTRY VALUES ('RUS','Rusia');
INSERT INTO COUNTRY VALUES ('SRI','Sri Lanka');
INSERT INTO COUNTRY VALUES ('TUR','Turkey');
INSERT INTO COUNTRY VALUES ('URU','Uruguay');
INSERT INTO COUNTRY VALUES ('USA','United States');
INSERT INTO COUNTRY VALUES ('VEN','Venezuela');

-- =======================================
-- IOC ROLE 
-- =======================================
INSERT INTO IOC_ROLE VALUES ('HC','Head Coach');
INSERT INTO IOC_ROLE VALUES ('JD','Judge');
INSERT INTO IOC_ROLE VALUES ('PS','Physician');
INSERT INTO IOC_ROLE VALUES ('MD','Media Communicator');
INSERT INTO IOC_ROLE VALUES ('LG','Logistic');

-- =======================================
-- LANGUAGE 
-- =======================================
INSERT INTO LANGUAGE VALUES ('AR','Arabic');
INSERT INTO LANGUAGE VALUES ('BE','Belarusian');
INSERT INTO LANGUAGE VALUES ('ZH','Chinese');
INSERT INTO LANGUAGE VALUES ('DA','Danish');
INSERT INTO LANGUAGE VALUES ('DE','German');
INSERT INTO LANGUAGE VALUES ('NL','Dutch');
INSERT INTO LANGUAGE VALUES ('EN','English');
INSERT INTO LANGUAGE VALUES ('FA','Persian');
INSERT INTO LANGUAGE VALUES ('FR','France');
INSERT INTO LANGUAGE VALUES ('HI','Hindi');
INSERT INTO LANGUAGE VALUES ('IT','Italian');
INSERT INTO LANGUAGE VALUES ('JA','Japanese');
INSERT INTO LANGUAGE VALUES ('MS','Malay');
INSERT INTO LANGUAGE VALUES ('RU','Russian');
INSERT INTO LANGUAGE VALUES ('ES','Spanish');
INSERT INTO LANGUAGE VALUES ('PT','Portuguese');


-- =======================================
-- OFFICIAL 
-- =======================================
INSERT INTO OFFICIAL VALUES ('AUS00101', 'Simon','Nathan','HC','AUS','EN');
INSERT INTO OFFICIAL VALUES ('AUS00102', 'William','Leung','HC','AUS','EN');
INSERT INTO OFFICIAL VALUES ('AUS00103', 'David','Hughes','PS','AUS','EN');
INSERT INTO OFFICIAL VALUES ('AUS00104', 'Mike','Tancred','MD','AUS','EN');
INSERT INTO OFFICIAL VALUES ('AUS00105', 'Lauren','Fitzgerald','LG','AUS','EN');
INSERT INTO OFFICIAL VALUES ('AUS00106', 'Andrew','Gaze','HC','AUS','EN');

INSERT INTO OFFICIAL VALUES ('JPN00101', 'Yamaguchi','Akibahara','HC','JPN','JA');
INSERT INTO OFFICIAL VALUES ('JPN00102', 'Nori','Yoshida','JD','JPN','JA');

INSERT INTO OFFICIAL VALUES ('CHN00101', 'Xi','Zhang','HC','CHN','ZH');
INSERT INTO OFFICIAL VALUES ('CHN00102', 'Cheng','Li','MD','CHN','ZH');

-- =======================================
-- LOCATION_TYPE
-- =======================================
INSERT INTO LOCATION_TYPE VALUES (1,'Hotel');
INSERT INTO LOCATION_TYPE VALUES (2,'Olympic Venue');
INSERT INTO LOCATION_TYPE VALUES (3,'Airport');
INSERT INTO LOCATION_TYPE VALUES (4,'Restaurant');
INSERT INTO LOCATION_TYPE VALUES (5,'Private Address');
INSERT INTO LOCATION_TYPE VALUES (6,'Unspecified');

-- =======================================
-- LOCATION
-- =======================================
INSERT INTO LOCATION VALUES (34,'Beijing National Stadium','1 Guojiatiyuchang S Rd', 'Chaoyang', 2);
INSERT INTO LOCATION VALUES (35,'Beijing National Aquatics Center','11 Tianchen E Rd', 'Chaoyang', 1);
INSERT INTO LOCATION VALUES (36,'National Speed Skating Oval','	Olympic Green', 'Chaoyang', 1);
INSERT INTO LOCATION VALUES (39,'Capital Indoor Stadium','56 Zhong Guan Cun Da Jie', 'Haidian', 2);
INSERT INTO LOCATION VALUES (40,'Wukesong Sports Centre','69 Fuxing Road', 'Haidian', 2);
INSERT INTO LOCATION VALUES (41,'National Alpine Ski Centre','Xiaohaituo Mountain', 'Yanqing', 2);
INSERT INTO LOCATION VALUES (1,'Beijing Capital International Airport','Shunyi District', 'Beijing', 3);


-- =======================================
-- VEHICLE
-- =======================================
INSERT INTO VEHICLE VALUES ('SANFDAE11U1286116','OLSID21','Volvo','XC90 Momentum','White',4);
INSERT INTO VEHICLE VALUES ('SB2252300ADT00644','OLSID22','Audi','A1','Silver',4);
INSERT INTO VEHICLE VALUES ('SD2252300BDU00040','OLSID23','BMW','X7 Xdrive30D','White',5);
INSERT INTO VEHICLE VALUES ('SK30URHHAAS217472','OLSID24','Honda','Honda Odyssey VTI','Black',7);
INSERT INTO VEHICLE VALUES ('SMNFDAE11U1286256','OLSID25','Mercedes','GLS-Class GLS350 d','White',5);
INSERT INTO VEHICLE VALUES ('SM30URHHAAS153052','OLSID26','Mercedes','GLS-Class GLS350 d','Black',5);
INSERT INTO VEHICLE VALUES ('SB2252300ADT01359','OLSID27','Audi','SQ7 TDI','Red',6);

COMMIT;