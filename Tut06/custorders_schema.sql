--student id: 31552544
--student name: Huixin Wang

--Capture run of scripts in file called custorders_schema_output.txt
set echo on
SPOOL custorders_schema_output.txt

-- Generated by Oracle SQL Developer Data Modeler 20.4.0.374.0801
--   at:        2022-01-24 03:53:25 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



DROP TABLE customer CASCADE CONSTRAINTS;

DROP TABLE orderline CASCADE CONSTRAINTS;

DROP TABLE orders CASCADE CONSTRAINTS;

DROP TABLE prod_category CASCADE CONSTRAINTS;

DROP TABLE product CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE customer (
    cust_no        NUMBER(7) NOT NULL,
    cust_name      VARCHAR2(50) NOT NULL,
    custo_address  VARCHAR2(50) NOT NULL,
    cust_phone     CHAR(10),
    cust_level     CHAR(1) NOT NULL
);

ALTER TABLE customer
    ADD CONSTRAINT chk_custlevel CHECK ( cust_level IN ( 'B', 'G', 'S' ) );

COMMENT ON COLUMN customer.cust_no IS
    'customer number';

COMMENT ON COLUMN customer.cust_name IS
    'customer name';

COMMENT ON COLUMN customer.custo_address IS
    'customer address';

COMMENT ON COLUMN customer.cust_phone IS
    'customer phone';

COMMENT ON COLUMN customer.cust_level IS
    'customer level, G-Gold, S-Silver, B-Bronze';

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_no );

CREATE TABLE orderline (
    orders_order_no  NUMBER(7) NOT NULL,
    product_prod_no  NUMBER(7) NOT NULL,
    ol_qtyordered    NUMBER(7) NOT NULL,
    ol_lineprice     CHAR(50) NOT NULL
);

COMMENT ON COLUMN orderline.orders_order_no IS
    'order number';

COMMENT ON COLUMN orderline.product_prod_no IS
    'product number';

COMMENT ON COLUMN orderline.ol_qtyordered IS
    'orderline quantity ordered';

COMMENT ON COLUMN orderline.ol_lineprice IS
    'orderline line price';

ALTER TABLE orderline ADD CONSTRAINT orderline_pk PRIMARY KEY ( orders_order_no,
                                                                product_prod_no );

CREATE TABLE orders (
    order_no          NUMBER(7) NOT NULL,
    order_date        DATE NOT NULL,
    customer_cust_no  NUMBER(7) NOT NULL
);

COMMENT ON COLUMN orders.order_no IS
    'order number';

COMMENT ON COLUMN orders.order_date IS
    'order date';

COMMENT ON COLUMN orders.customer_cust_no IS
    'customer number';

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( order_no );

CREATE TABLE prod_category (
    pcat_id    NUMBER(7) NOT NULL,
    pcat_name  VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN prod_category.pcat_id IS
    'product category id';

COMMENT ON COLUMN prod_category.pcat_name IS
    'product category name';

ALTER TABLE prod_category ADD CONSTRAINT prod_category_pk PRIMARY KEY ( pcat_id );

CREATE TABLE product (
    prod_no                NUMBER(7) NOT NULL,
    prod_desc              VARCHAR2(50) NOT NULL,
    prod_unitprice         VARCHAR2(50) NOT NULL,
    prod_category          VARCHAR2(50) NOT NULL,
    prod_category_pcat_id  NUMBER(7) NOT NULL
);

COMMENT ON COLUMN product.prod_no IS
    'product number';

COMMENT ON COLUMN product.prod_desc IS
    'product description';

COMMENT ON COLUMN product.prod_unitprice IS
    'product unit price';

COMMENT ON COLUMN product.prod_category IS
    'product category';

COMMENT ON COLUMN product.prod_category_pcat_id IS
    'product category id';

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( prod_no );

ALTER TABLE orders
    ADD CONSTRAINT customer_orders FOREIGN KEY ( customer_cust_no )
        REFERENCES customer ( cust_no );

ALTER TABLE product
    ADD CONSTRAINT pcat_product FOREIGN KEY ( prod_category_pcat_id )
        REFERENCES prod_category ( pcat_id );

ALTER TABLE orderline
    ADD CONSTRAINT product_orderline FOREIGN KEY ( product_prod_no )
        REFERENCES product ( prod_no );

ALTER TABLE orderline
    ADD CONSTRAINT relation_3 FOREIGN KEY ( orders_order_no )
        REFERENCES orders ( order_no );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             10
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

SPOOL off
set echo off
