--GRADING SYSTEM--
SELECT * FROM EMPLOYEE_TAB 
SELECT * FROM EMPLOYEE_TAB3
SELECT * FROM CUSTOMER_TAB 
SELECT * FROM VENDOR_TAB 
SELECT * FROM SPAREPART_TAB
SELECT * FROM PURCHASE_TAB
SELECT * FROM ser_det_tab

alter table ser_det_tab rename column cid_fk to cid;
select pid_pk from PURCHASE_TAB where PURCHASE_TAB.EID=EMPLOYEE_TAB3.Eid_Pk;

RENAME EMPLOYEE_TAB3 TO E_ID;

select cname from CUSTOMER_TAB,ser_det_tab where CUSTOMER_TAB.cid=ser_det_tab.cid;  ---natural join

select * from CUSTOMER_TAB as c1, CUSTOMER_TAB as c2 where c1.cid=c2.cid;---self join
