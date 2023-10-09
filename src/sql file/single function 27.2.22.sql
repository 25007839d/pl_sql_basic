--- **NUMERIC FUNCTIONS**---    
     
select Abs (25.34) from dual; 
select Abs (-25.34) from dual;  --abs function
select Abs (dig) from sin_fun;

create table sin_fun (id varchar2(10),dig number(20));
insert into sin_fun values(106, 20.5, 'Rakhi');
select * from sin_fun
alter table sin_fun add (sname varchar2 (20));

select Sign(90) from dual;
select sqrt(4), sqrt(0), sqrt(null), sqrt(1) from dual;
select mod(7,4), mod(11,3), mod(null,null), mod(0,0), mod(-7,4) from dual;--sheshfal
select mod(id,dig) from sin_fun;

--e) NVL
--This will substitutes the specified value in the place of null values.
Syntax: nvl (null_col, replacement_value)

select nvl(dig,20) from sin_fun;


--Power
select power (dig,2) from sin_fun;



--Exp
select exp(2) from dual;
--Ln
--Log
--Ceil
select ceil(5), ceil(5.98), ceil(5.1), ceil( -5.9), ceil(0.1), ceil(null) from dual;-- its convert in to whole no higher side
 
--Floor
select Floor(5), Floor(5.98), Floor(5.1), Floor( -5.9), Floor(0.1), Floor(null) from dual;-- its convert in to whole no lower side
--Round
select Round(5), Round(5.98), Round(5.1), Round( -5.9), Round(0.1), Round(null) from dual;

--Trunkc
select trunc(123.2345), trunc(123.2345,1), trunc(123.2354,2) from dual;
--Bitand
select bitand(2,2), bitand(0,0), bitand(1,1), bitand(null,null), bitand(-2,-3) from dual; ---cccc

--Greatest
select greatest(1, 2, 3), greatest(-1, -2, -3) from dual; 
select greatest (id) from sin_fun; -- not run in table column


--Least
select Least(1, 2, 3), Least(-1, -2, -3) from dual; 

--Coalesce      
select coalesce(1,2,3), coalesce(null,2,null,5) from dual; ---This will return first non-null value

select coalesce (id) from sin_fun;---cccc


       
--**STRING FUNCTIONS**--
--Initcap
select initcap(sname) from sin_fun;

--Upper
select Upper(sname) from sin_fun;
--Lower
select Lower(sname) from sin_fun;

--Length

 select length(sname) from sin_fun;

--Rpad 
select rpad('rakesh',10,'2') from dual;
 select rpad('computer',15,'*'), rpad('computer',15,'*#') from dual;

--Lpad
select lpad('computer',15,'*'), lpad('computer',15,'*#') from dual;
 select lpad(sname,10,'*') from sin_fun;

--Ltrim  
select ltrim(sname,'R') from sin_fun;--specify caps ka bhi impact karta hai
select ltrim('computer','co'), ltrim('computer','com') from dual; 


Rtrim
--Trim
select trim( 'i' from 'indiani') from dual; 
select trim ('r' from sname)  from sin_fun;
select trim ('r' from 'sname')  from sin_fun;-- will give diffrent result.

--Translate
select translate('india','in','xy') from dual; 

--Replace
select Replace('india','in','xy') from dual; 

--Soundex
 select * from sin_fun where soundex(sname) = soundex('ram'); 

--Concat ( ‘ || ‘ Concatenation operator)

select concat('computer',' operator') from dual; 
select concat(id,sname)from sin_fun;
--Ascii
select ascii('a'), ascii('apple') from dual;

--Chr
 select chr(97) from dual; 

--Substr
select  rpad(substr('computer',3,9),9,'*') from dual;
select  substr('computer',3,9) from dual;
--Instr
select instr('information','i',5) from dual;

--Decode
select esal ,decode(esal,500,'Low',2200,'High','Medium') from EMPLOYEE_TAB; 

select * from employee_tab1
select decode(eadd,'NEW YORK','delhi')from employee_tab1;


--Greatest
select greatest('10', '12', '2'), greatest('satish','srinu','saketh') from dual;

--Least
 select least('a', 'b', 'c'), least('satish','srinu','saketh') from dual;

--Coalesce
 select coalesce('a','b','c'), coalesce(null,'a',null,'b') from dual; 

--case

Select Esal,
Case Esal
When 500 then ‘low’
When 5000 then ‘high’
Else ‘medium’
End case
From emp;




--
select case when eid_pk=3001
then 'min sal is'|| 1100
  when eid_pk=3003
    then 'min sal is'||2200
     else
       'remaining not reqd'
       end from EMPLOYEE_TAB1;
 --**--      
  select case when eid_pk=3001
then 1
  when eid_pk=3003
    then 3
     else
       0
       end from EMPLOYEE_TAB1;     

SELECT * FROM EMPLOYEE_TAB1;
SELECT ENAME||EADD FROM EMPLOYEE_TAB1;

--**DATE FUNCTIONS**---
--Sysdate
select sysdate from dual;
--Current_date
select Current_date from dual;

--Current_timestamp
select Current_timestamp from dual;

--Systimestamp
select Systimestamp from dual;

--Localtimestamp
select Localtimestamp from dual;

--Dbtimezone
select Dbtimezone from dual;


Sessiontimezone
To_char

select months_between(to_date('31-dec-2021','dd-mon-yyyy'), to_date('01-jan-
2021','dd-mon-yyyy')) from dual;


MONTHS_BETWEEN(TO_DATE('11-AUG-1990
To_date
Add_months
Months_between
Next_day
Last_day
Extract
Greatest 


