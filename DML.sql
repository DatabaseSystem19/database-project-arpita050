--DML
INSERT INTO bloodBank (bb_id, bb_name, bb_city, bb_contactNo, area)VALUES (1001, 'ABC Blood Bank', 'New 
York', 1234567890, 'Central');
INSERT INTO bloodBank (bb_id, bb_name, bb_city, bb_contactNo, area)VALUES (1002, 'XYZ Blood Bank', 'Los 
Angeles', 9876543210, 'West');
INSERT INTO bloodBank (bb_id, bb_name, bb_city, bb_contactNo, area)VALUES (1003, 'PQR Blood Bank', 
'Chicago', 5556667777, 'North');
INSERT INTO bloodBank (bb_id, bb_name, bb_city, bb_contactNo, area)VALUES (1004, 'MNO Blood Bank', 
'San Francisco', 8889990000, 'West');
INSERT INTO bloodBank (bb_id, bb_name, bb_city, bb_contactNo, area)VALUES (1005, 'DEF Blood Bank', 'New 
York', 1112223333, 'Central');
INSERT INTO donor (d_id, d_name, d_gender, d_age, d_bloodGrp, d_city, last_date_of_donation, d_contactNo, 
bb_id)VALUES (1, 'John Smith', 'Male', 25, 'O+', 'New York', TO_DATE('2023-05-15', 'YYYY-MM-DD'), 
1234567890, 1001);
INSERT INTO donor (d_id, d_name, d_gender, d_age, d_bloodGrp, d_city, last_date_of_donation, d_contactNo, 
bb_id)VALUES (2, 'Emily Johnson', 'Female', 30, 'A-', 'Los Angeles', TO_DATE('2023-05-20', 'YYYY-MM-DD'), 
9876543210, 1002);
INSERT INTO donor (d_id, d_name, d_gender, d_age, d_bloodGrp, d_city, last_date_of_donation, d_contactNo, 
bb_id)VALUES (3, 'Emma Johnson', 'Female', 29, 'B+', 'Los Angeles', TO_DATE('2023-05-25', 'YYYY-MM-DD'), 
8888888888, 1001);
INSERT INTO donor (d_id, d_name, d_gender, d_age, d_bloodGrp, d_city, last_date_of_donation, d_contactNo, 
bb_id)VALUES (4, 'William Wilson', 'Male', 32, 'AB+', 'Chicago', TO_DATE('2023-05-28', 'YYYY-MM-DD'), 
7777777777, 1002);
INSERT INTO donor (d_id, d_name, d_gender, d_age, d_bloodGrp, d_city, last_date_of_donation, d_contactNo,
bb_id)VALUES (5, 'Olivia Davis', 'Female', 27, 'O-', 'San Francisco', TO_DATE('2023-05-30', 'YYYY-MM-DD'), 
9999999999, 1003);
INSERT INTO blood (b_id, b_bloodGrp, date_donated)VALUES (101, 'O+', TO_DATE('2023-05-15', 'YYYY-MMDD'));
INSERT INTO blood (b_id, b_bloodGrp, date_donated)VALUES (102, 'A-', TO_DATE('2023-05-20', 'YYYY-MMDD'));
INSERT INTO blood (b_id, b_bloodGrp, date_donated)VALUES (103, 'B+', TO_DATE('2023-05-25', 'YYYY-MMDD'));
INSERT INTO blood (b_id, b_bloodGrp, date_donated)VALUES (104, 'AB+', TO_DATE('2023-05-28', 'YYYY-MMDD'));
INSERT INTO blood (b_id, b_bloodGrp, date_donated)VALUES (105, 'O-', TO_DATE('2023-05-30', 'YYYY-MMDD'));
INSERT INTO patient (p_id, p_name, p_gender, p_age, p_bloodGrp, p_city, p_contactNo)VALUES (10001, 'Sarah 
Davis', 'Female', 35, 'B+', 'San Francisco', 5551112222);
INSERT INTO patient (p_id, p_name, p_gender, p_age, p_bloodGrp, p_city, p_contactNo)VALUES (10002, 
'Michael Brown', 'Male', 40, 'AB-', 'Chicago', 9998887777);
INSERT INTO patient (p_id, p_name, p_gender, p_age, p_bloodGrp, p_city, p_contactNo)VALUES (10003, 
'David Smith', 'Male', 50, 'O-', 'New York', 7777777777);
INSERT INTO patient (p_id, p_name, p_gender, p_age, p_bloodGrp, p_city, p_contactNo)VALUES (10004, 
'Sophia Taylor', 'Female', 22, 'A+', 'Los Angeles', 8888888888);
INSERT INTO patient (p_id, p_name, p_gender, p_age, p_bloodGrp, p_city, p_contactNo)VALUES (10005, 
'James Anderson', 'Male', 45, 'B-', 'Chicago', 9999999999);
INSERT INTO donateBlood (b_id, d_id, p_id, bb_id, dateOfDonation)VALUES (101, 1, 10001, 1001, 
TO_DATE('2023-05-15', 'YYYY-MM-DD'));
INSERT INTO donateBlood (b_id, d_id, p_id, bb_id, dateOfDonation)VALUES (102, 2, 10002, 1002, 
TO_DATE('2023-05-20', 'YYYY-MM-DD'));
INSERT INTO donateBlood (b_id, d_id, p_id, bb_id, dateOfDonation)VALUES (103, 3, 10003, 1003, 
TO_DATE('2023-05-25', 'YYYY-MM-DD'));
INSERT INTO donateBlood (b_id, d_id, p_id, bb_id, dateOfDonation)VALUES (104, 4, 10004, 1004, 
TO_DATE('2023-05-28', 'YYYY-MM-DD'));
INSERT INTO donateBlood (b_id, d_id, p_id, bb_id, dateOfDonation)VALUES (105, 5, 10005, 1005, 
TO_DATE('2023-05-30', 'YYYY-MM-DD'));
--select command
select * from bloodBank;
select * from donor;
select * from blood;
select * from patient;
select * from donateBlood;
--update, delete
update patient set p_name='Sara Devis' where p_id=10001;
INSERT INTO donor (d_id, d_name, d_gender, d_age, d_bloodGrp, d_city, last_date_of_donation, d_contactNo, 
bb_id)VALUES (6, 'Sara Parker', 'Female', 37, 'O+', 'San Atlanta', TO_DATE('2023-06-30', 'YYYY-MM-DD'), 
1999999999, 1003);
delete from donor where d_id=6;
--string operation
select d_gender from donor where d_gender like 'F%';
--aggregate
select count(*) from donor;
select count(p_name) as number_of_patients from patient;
select count(distinct b_bloodGrp) as number_of_blood_groups from blood;
--group by
select d_gender,avg(d_age) from donor group by d_gender having avg(d_age)>=10;
--nested
select d_name from donor where d_id=(select d_id from donateBlood where p_id=(select p_id from 
donateBlood where bb_id=(select bb_id from bloodBank where bb_name='ABC Blood Bank')));
--membership
SELECT * FROM donor WHERE d_age >= 20 AND d_id IN (SELECT d_id FROM donateBlood WHERE 
d_bloodGrp LIKE '%A%');