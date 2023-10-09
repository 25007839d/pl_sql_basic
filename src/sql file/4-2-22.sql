CREATE TABLE SER_DET_TAB1 (SID_PK NUMBER(8)PRIMARY KEY,CID_FK NUMBER (8)REFERENCES CUSTOMER_TAB(CID_PK),
EID_FK NUMBER(8)REFERENCES EMPLOYEE_TAB(EID_PK),TYP_VEH VARCHAR2(8),SER_DATE DATE);

select * from employee_tab where esal!=1000;

------ group by-----
select ename, ejob, esal from employee_tab where
 ejob in(select ejob from employee_tab group by ejob having count( *) >1);
 
 select ename, ejob, esal from employee_tab where eid_pk between 3001 and 3006;
 
 select * from employee_tab where eid_pk between 3001 and 3006;
 
 select * from employee_tab where ename like'd%';
 
