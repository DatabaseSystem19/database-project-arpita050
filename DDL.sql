drop table donateBlood;
drop table patient;
drop table blood;
drop table donor;
drop table bloodBank;
---Set line size and page size
set pagesize 300
set linesize 300
--Table Creation
CREATE TABLE bloodBank (
 bb_id NUMBER(20),
 bb_name VARCHAR2(30),
 bb_city VARCHAR2(30),
 bb_contactNo NUMBER(11),
 bb_area VARCHAR2(30),
 PRIMARY KEY (bb_id)
);
CREATE TABLE donor (
 d_id NUMBER(20),
 d_name VARCHAR2(30),
 d_gender VARCHAR2(6),
 d_age NUMBER(3),
 d_bloodGrp VARCHAR2(10),
 d_city VARCHAR2(30),
 last_date_of_donation DATE,
 d_contactNo NUMBER(11),
 bb_id NUMBER(20),
 PRIMARY KEY (d_id),
 FOREIGN KEY (bb_id) REFERENCES bloodBank (bb_id)
);
CREATE TABLE blood (
 b_id NUMBER(20),
 bb_id NUMBER(20),
 d_id NUMBER(20),
 b_bloodGrp VARCHAR2(10),
 date_donated DATE,
 PRIMARY KEY (b_id),
 FOREIGN KEY (bb_id) REFERENCES bloodBank (bb_id),
 FOREIGN KEY (d_id) REFERENCES donor (d_id)
);
CREATE TABLE patient (
 p_id NUMBER(20),
 p_name VARCHAR2(30),
 p_gender VARCHAR2(6),
 p_age NUMBER(3),
 p_bloodGrp VARCHAR2(10),
 p_city VARCHAR2(30),
 p_contactNo NUMBER(11),
 PRIMARY KEY (p_id)
);
CREATE TABLE donateBlood (
 b_id NUMBER(20),
 d_id NUMBER(20),
 p_id NUMBER(20),
 bb_id NUMBER(20),
 dateOfDonation DATE,
 PRIMARY KEY (b_id, d_id, p_id, bb_id),
 FOREIGN KEY (b_id) REFERENCES blood (b_id),
 FOREIGN KEY (d_id) REFERENCES donor (d_id),
 FOREIGN KEY (p_id) REFERENCES patient (p_id),
 FOREIGN KEY (bb_id) REFERENCES bloodBank (bb_id)
);
--DDL
ALTER TABLE bloodBank ADD bb_area VARCHAR2(30);
ALTER TABLE bloodBank MODIFY bb_area VARCHAR2(30);
ALTER TABLE bloodBank RENAME COLUMN bb_area TO area;
ALTER TABLE blood DROP COLUMN d_id;
ALTER TABLE blood DROP COLUMN bb_id;