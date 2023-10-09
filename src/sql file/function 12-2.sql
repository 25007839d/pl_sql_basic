--
select ascii('A') from dual;
select chr(120) from dual;
select substr('this is my string ',3,1) from dual;--imp
select instr('abcd','a',1) from dual;
select instr(ename,'r',1,2),ename from employee_tab;

---***---
select '101,201,203,204,205,1019,2019,2125' tt from dual;
select substr('101,201,301,401',1,instr('101,201,301,404',',',1)-1) as prod_id from dual;
select regexp_substr('101,201,203,204,205,1019,2019,2125'
, '[^,]+', 1, 1) as val1, 
       regexp_substr('101,201,203,204,205,1019,2019,2125'
, '[^,]+', 1, 2) as val2, 
       regexp_substr('101,201,203,204,205,1019,2019,2125'
, '[^,]+', 1, 3) as val3
       from dual;
       
select substr('101,201,203,204,205,1019,2019,2125',1,3) as prid,substr('101,201,203,204,205,1019,2019,2125',5,7) as pidf from dual

select 101 tt,201 bb,203 cc,203 dd,205 ee,1019 ff,2019 gg,2125 hh from dual;
select sysdate from dual;
select current_date from dual;
select current_timestamp from dual;
select systimestamp from dual;
select localtimestamp from dual;
select dbtimezone from dual;
select sessiontimezone from dual;
select to_char(sysdate,'dd-mm-rrrr') from dual' ---normal usage in multiple formate
select to_char(sysdate,'dd-mm-rrrr hh:mi:ss pm') from dual;
select add_months(sysdate,2) from dual;

select months_between(sysdate,sysdate-100) from dual;
select next_day(sysdate) from dual;
select last_day(sysdate) from dual;
select extract (month from sysdate) from dual;--current data
select round( months_between(sysdate,sysdate-100)) from dual;

trunc select trunc( months_between(sysdate,sysdate-100)) from dual;


select to_char(new_time(sysdate,'gmt','yst'),'dd mon yyyy hh:mi:ss am') from dual;

---convertion Function
to_char
to_number
to_date

----group functions
/*
min 
max
avg
count
sum  */

select * from EMPLOYEE_TAB

update EMPLOYEE_TAB  set esal = 2200 WHERE eid_PK=3000;
select max(esal),eid_pk from EMPLOYEE_TAB
group by eid_pk;

---csae is not a function
--case is a statement

select case when eid_pk=3001
then 'min sal is'|| 1100
  when eid_pk=3003
    then 'min sal is'||2200
     else
       'remaining not reqd'
       end from EMPLOYEE_TAB;
