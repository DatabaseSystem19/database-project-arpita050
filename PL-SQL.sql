--PL/SQL
--variable declaration and print
set serveroutput on
declare 
bb_id bloodBank.bb_id%type;
bb_name bloodBank.bb_NAME%type;
begin
select bb_id, bb_name into bb_id, bb_name from bloodBank where bb_id=1002;
dbms_output.put_line('BloodBank_id: '||bb_id|| ' BloodBank_name: '||bb_name);
end;
/
--insert and set default value
SET SERVEROUTPUT ON;
DECLARE
 bb_id bloodBank.bb_id%TYPE := 1006;
 bb_name bloodBank.bb_name%TYPE := 'GHI Blood Bank';
 bb_city bloodBank.bb_city%TYPE := 'Seattle';
 bb_contactNo bloodBank.bb_contactNo%TYPE := 5555555555;
 area bloodBank.area%TYPE := 'Northwest';
BEGIN
 INSERT INTO bloodBank (bb_id, bb_name, bb_city, bb_contactNo, area)
 VALUES (bb_id, bb_name, bb_city, bb_contactNo, area);
 DBMS_OUTPUT.PUT_LINE('Row inserted successfully.');
 commit;
END;
/
--rowtype
SET SERVEROUTPUT ON;
DECLARE
 bloodBank_row bloodBank%ROWTYPE;
BEGIN
 SELECT bb_id, bb_name, bb_city, bb_contactNo, area
 INTO bloodBank_row.bb_id, bloodBank_row.bb_name, bloodBank_row.bb_city, 
bloodBank_row.bb_contactNo, bloodBank_row.area
 FROM bloodBank
 WHERE bb_id = 1005;
 
 DBMS_OUTPUT.PUT_LINE('bb_id: ' || bloodBank_row.bb_id);
 DBMS_OUTPUT.PUT_LINE('bb_name: ' || bloodBank_row.bb_name);
 DBMS_OUTPUT.PUT_LINE('bb_city: ' || bloodBank_row.bb_city);
 DBMS_OUTPUT.PUT_LINE('bb_contactNo: ' || bloodBank_row.bb_contactNo);
 DBMS_OUTPUT.PUT_LINE('area: ' || bloodBank_row.area);
end;
/
--cursor
SET SERVEROUTPUT ON;
DECLARE
 CURSOR bloodBank_cursor IS
 SELECT bb_id, bb_name, bb_city, bb_contactNo, area
 FROM bloodBank;
 bloodBank_row bloodBank_cursor%ROWTYPE;
 total_rows INTEGER := 0;
BEGIN
 OPEN bloodBank_cursor;
 LOOP
 FETCH bloodBank_cursor INTO bloodBank_row;
 EXIT WHEN bloodBank_cursor%NOTFOUND;
 
 DBMS_OUTPUT.PUT_LINE('bb_id: ' || bloodBank_row.bb_id || ', bb_name: ' || bloodBank_row.bb_name || ', 
bb_city: ' || bloodBank_row.bb_city || ', bb_contactNo: ' || bloodBank_row.bb_contactNo || ', area: ' || 
bloodBank_row.area);
 total_rows := total_rows + 1;
 DBMS_OUTPUT.PUT_LINE('');
 END LOOP;
 
 CLOSE bloodBank_cursor;
 DBMS_OUTPUT.PUT_LINE('Total rows: ' || total_rows);
END;
/
--if-else
SET SERVEROUTPUT ON
DECLARE
 counter NUMBER := 1;
 donor_blood_group donor.d_bloodGrp%TYPE;
BEGIN
 counter := 1;
 FOR x IN 1..5 
 LOOP
 SELECT d_bloodGrp INTO donor_blood_group FROM donor WHERE d_id = x;
 IF donor_blood_group IN ('A+', 'B+', 'AB+', 'O+') THEN
 DBMS_OUTPUT.PUT_LINE(donor_blood_group || ' is positive');
 ELSIF donor_blood_group IN ('A-', 'B-', 'AB-', 'O-') THEN
 DBMS_OUTPUT.PUT_LINE(donor_blood_group || ' is negative');
 END IF;
 END LOOP;
END;
/
--procedure
CREATE OR REPLACE PROCEDURE GetBloodBankName(
 bb_id IN bloodBank.bb_id%TYPE
)
AS
 BloodBank_name bloodBank.bb_name%TYPE;
BEGIN
 SELECT bb_name INTO BloodBank_name FROM bloodBank WHERE bb_id = GetBloodBankName.bb_id;
 DBMS_OUTPUT.PUT_LINE('Blood Bank Name: ' || BloodBank_name);
END;
/
--callProcedure
SET SERVEROUTPUT ON;
DECLARE
 BloodBank_id bloodBank.bb_id%TYPE := 1001; 
BEGIN
 GetBloodBankName(BloodBank_id);
END;
/
--function
CREATE OR REPLACE FUNCTION GetTotalDonorsByBloodType(
 blood_type IN donor.d_bloodGrp%TYPE
) RETURN NUMBER
AS
 total_donors NUMBER;
BEGIN
 SELECT COUNT(*) INTO total_donors FROM donor WHERE d_bloodGrp = blood_type;
 RETURN total_donors;
END;
/
--callFunction
DECLARE
 blood_type donor.d_bloodGrp%TYPE := 'B+';
 donors_count NUMBER;
BEGIN
 donors_count := GetTotalDonorsByBloodType(blood_type);
 DBMS_OUTPUT.PUT_LINE('Total Donors with Blood Type ' || blood_type || ': ' || donors_count);
END;
/
--drop
drop procedure GetBloodBankName;
drop function GetTotalDonorsByBloodType;