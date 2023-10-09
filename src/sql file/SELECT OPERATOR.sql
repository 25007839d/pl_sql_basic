--GRADING SYSTEM--
SELECT * FROM EMPLOYEE_TAB 
SELECT * FROM EMPLOYEE_TAB3
SELECT * FROM CUSTOMER_TAB 
SELECT * FROM VENDOR_TAB 
SELECT * FROM SPAREPART_TAB
SELECT * FROM PURCHASE_TAB
SELECT * FROM ser_det_tab


--ritu practic
select * from  PURCHASE_Tab where pqty>15

select max( esal) from employee_tab3;

select 'xxx' esal  from employee_tab3 where esal <2000;

select  eadd from employee_tab3 group by (eadd);

select * from EMPLOYEE_TAB3 where eadd = 'PARIS';
( SELECT EADD , COUNT(*) FROM EMPLOYEE_TAB3 GROUP BY EADD);

select * from  EMPLOYEE_TAB3 where esal in(select  max(esal) from EMPLOYEE_TAB3 WHERE EADD = 'PARIS');

SELECT * FROM EMPLOYEE_TAB3 WHERE EADD IN ('PARIS','JERCY');

SELECT * FROM EMPLOYEE_TAB3 WHERE EADD NOT IN ('PARIS','JERCY');


SELECT * FROM EMPLOYEE_TAB3 WHERE EADD IN (SELECT EADD FROM EMPLOYEE_TAB3 GROUP BY EADD HAVING COUNT(*)<2);


---max and second highest sal
select * from  EMPLOYEE_TAB3 where esal= (select max(esal)from EMPLOYEE_TAB3);

select * from  PURCHASE_Tab where pqty= (select min(pqty)from PURCHASE_TAB);
select * from  PURCHASE_Tab where pqty= (select last second(pqty)from PURCHASE_TAB);

select * from  EMPLOYEE_TAB3 where esal in(select  max(esal) from EMPLOYEE_TAB3 where esal< (select max(esal) from EMPLOYEE_TAB3));update EMPLOYEE_TAB3 set esal = 1700 WHERE eid_PK=3000;



 --max sallary--
 
 select cid,total from ser_det_taB where total=(select max(total) from ser_det_taB);
 
 SELECT * FROM EMPLOYEE_TAB3 WHERE ESAL=(SELECT Min(ESAL) FROM EMPLOYEE_TAB3);


select esal from EMPLOYEE_TAB where esal=(select min(esal) from EMPLOYEE_TAB); 

select * from EMPLOYEE_TAB where esal=(select min(esal) from EMPLOYEE_TAB);


---highest dep. wise salary---
select * from employee_tab5 where esal in (select max(esal) from employee_tab5 group by ejob);

---UNION-------- 
SELECT * FROM EMPLOYEE_TAB1
UNION
SELECT * FROM EMPLOYEE_TAB2
UNION
SELECT * FROM EMPLOYEE_TAB3;

SELECT * FROM EMPLOYEE_TAB4  

---union all-----

SELECT * FROM EMPLOYEE_TAB  
UNION all
SELECT * FROM EMPLOYEE_TAB1
UNION all
SELECT * FROM EMPLOYEE_TAB2
UNION all
SELECT * FROM EMPLOYEE_TAB3
UNION ALL 
SELECT * FROM EMPLOYEE_TAB5; 

--intersect-------
SELECT * FROM EMPLOYEE_TAB 
intersect
SELECT * FROM EMPLOYEE_TAB1
intersect
SELECT * FROM EMPLOYEE_TAB2
intersect
SELECT * FROM EMPLOYEE_TAB3; 


--minus--

SELECT * FROM EMPLOYEE_TAB 
minus
SELECT * FROM EMPLOYEE_TAB1
minus
SELECT * FROM EMPLOYEE_TAB3
minus
SELECT * FROM EMPLOYEE_TAB1;

 

SELECT distinct ename FROM EMPLOYEE_TAB1;--distinct


------ group by--- is A CLAUSE OR FUNCTION  ***ROUP BY K SATH JO B ATTRIBUTE LAGA HAI WAHI HUM USE KAR SAKTE HAI SELECT K BAD AND AGGRIGATE FUNCTION

 
 select eadd from EMPLOYEE_TAB3 group by eadd;---showing owerall department
 
 SELECT EJOB FROM EMPLOYEE_TAB GROUP BY EJOB; ---IF CALCULATE HOW MANY DEPART...OR GROUP NOS--USE ONLY AGGRIGATE FUNCTION IN GROUP BY
  SELECT EJOB , COUNT(*) FROM EMPLOYEE_TAB1 GROUP BY EJOB;
    SELECT EJOB , COUNT(EJOB) FROM EMPLOYEE_TAB1 GROUP BY EJOB;


---HAVING CLAUSE  ( we cant use where in group by clause)
select * from EMPLOYEE_TAB3  where eadd in (select eadd from EMPLOYEE_TAB3 group by eadd having count( *)=2);--nested quari, we can use = also insted in

 SELECT EJOB , COUNT(EJOB) FROM EMPLOYEE_TAB1 GROUP BY EJOB having count(*)<2;

 
 select ename from employee_tab1 where esal = (select max (esal) from employee_tab1);
 
 
 ---in operator 
 
 select * from EMPLOYEE_TAB3 where ejob in ('painter');

--like operator---
select * from EMPLOYEE_TAB where esal like 1200;

--null operator--

--user_constraints---
select * from user_constraints
where table_name=' VENDOR_TAB'

--12 feb-----Function's------
select esal+esal, esal from EMPLOYEE_TAB

select (esal) from EMPLOYEE_TAB

--1. single row function
--2. multiple row function  
--simple function
--group function

select ename||'~~'||ejob from EMPLOYEE_TAB --simple function

--numeric function
--string function
--date function
--regexp fuynctions
--**numeric
select abs(1200) from EMPLOYEE_TAB

SELECT * FROM PURCHASE_TAB
select abs (10) from dual;
select power (3,6) from dual;
select mod(25,7) from dual;
select sqrt(4) from dual;
select remainder(20,6)from dual;
select round(100.52556,2) from EMPLOYEE_TAB;
 select ceil(-36.2) from EMPLOYEE_TAB; --always last number high
 select floor(100.5) from EMPLOYEE_TAB;--always last number low
 select trunc(100.91) from dual;
 select greatest(5,5,3,4) from dual;
 select least (0,8,2,1,6,4) from dual;
select length (ename) from EMPLOYEE_TAB; --same for number and char

select decode(ename,'steven','true,'fals')tt from dual;
select decode(1,2,3,4)tt from dual; ---true function 
select nvl(ename,0) from employee_tab; -- if not found null value sahow as it is 
select nvl2(ename,0,1)from employee_tab;-- 0 show not null,1 show null cell
select coalesce(null,null,null,1,23,24,4,null) from dual; --check forst nomial value

select initcap('ashop') from dual;
select upper('ashop') from dual;
select lower('ashop') from dual;
select rpad('ashok',8,'*') from dual;
select lpad('ashok',8,'*') from dual;
select ltrim('hok') from dual;
select rtrim('hok') from dual;
select trim('hok') from dual;
select translate('India','i','a') from dual;

select replace('india','i','aaaa') from dual;
select concat (ename,ejob) from EMPLOYEE_TAB;
select concat (ename,||'~~'|| ejob) from EMPLOYEE_TAB;
floor
log
len
in
sin
cos
tan
min
max
trunc
avg
count
sum
greatest
least
length
fact
dcode
cubelimit
medium
mode
From Dattatray Tompe to Everyone 10:03 PM
select abs(10) from dual;
select power(3,6) from dual;
--select cube(3) from dual; Not a valid Function
select mod(15,5) from dual;   --- IMP -- Remainder 
select REMAINDER(20,3) from dual;
select sqrt(4) from dual;
select round(floor( 100.99),2) from dual;  -- IMP  100665701
select round(100.99,1) from dual; -- IMP
select floor(101) from dual; -- IMP
select trunc(100.90,2) from dual ;
select greatest(4,2,3,1) from dual;
select least(4,2,3,1) from dual;
select length(first_name) from emp
select decode(1,1,2,3)ttttttttt from dual
select nvl(commission_pct,0) from emp;
select nvl2(commission_pct,0,1),commission_pct from emp;
select coalesce(null,null,null,1,23,4,null) from dUAL


SELECT * FROM CUSTOMER_TAB
SELECT * FROM VENDOR_TAB 
--SELECT * FROM EMPLOYEE_TAB4 
SELECT * FROM EMPLOYEE_TAB1
SELECT * FROM EMPLOYEE_TAB2
SELECT * FROM EMPLOYEE_TAB3
SELECT * FROM EMPLOYEE_TAB3
SELECT * FROM EMPLOYEE_TAB5--
---
SELECT * FROM SPAREPART_TAB;
SELECT * FROM PURCHASE_TAB

alter table PURCHASE_TAB rename column SPID_FK TO SPID_PK;
select * from ser_det_tab
