create table tb (id float(20));
drop table tb;
insert into tb values (&id);
select * from tb
-------------------------------------------
create table tb1 (id varchar2(20));
drop table tb1;
insert into tb1 values (&id);
select * from tb1 where id like ('%@gmail.com');

------------------------------------------
select  * from tb a inner join tb b on a.id=b.id;

select id,null as name from tb
minus
select * from tb1;

SELECT * INTO tb2 FROM tb1;  

                                       
--nub-function
select * from tb;
select id, Abs(id),round(id),floor(id),ceil(id),nvl(id,100)
,trunc(id,-1),power(id,2),Coalesce(1,null,2),least(id),greatest(id),mod(id,2),log(10,round(abs(id),1)) from tb;
select log(10,round(abs(id),1)) from tb;
--string function-----------------------

select id, upper(id),initcap(id),lower(id),rpad((lpad(id,12,'#')),15,'@'),rtrim(id,'hy'),
ltrim(id,'dush'),trim('r' from id),translate(id,'i','g')|| '\\ ' || replace(id,'ritu','laksh') from tb1;
select substr('computer',2), substr('computer',2,5), substr('computefdfgfr',3,7) from dual;

select id, instr(id,' ',1,2) from tb1;

----------------------------------str function----------------------------
select id, initcap(substr(id,1,instr(id,' ',1,1))) as first_name,
initcap(substr(id,instr(id,' ',1,1)+1,length(id)-instr(id,' ',1,1))) as last_name
 from tb1 
 
select id, substr(id,instr(id,'@',1,1)+1,(instr(id,'.',1,1)-instr(id,'@',1,1)-1)) from tb1 


select substr('d_u_s_h',length('d_u_s_h'),length('d_u_s_h') ) from dual
select substr('u_s_h',instr('u_s_h','_',1,2)-1,instr('u_s_h','_',1,2)-3) from dual

SELECT value FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ');
WITH numbers AS
 (SELECT "1,2" as number
 UNION ALL
 SELECT "2,3" as number
 UNION ALL
 SELECT "4,2" as number)
SELECT
 SPLIT(number, ',')[offset(0)] as a,
 SPLIT(number, ',')[offset(1)] as b,
from numbers

select ('gnb_enb_id'|| '_' || 'sector_number') from dual;

select instr(id,'@',1,1) from tb1 

select '***'||id|| '***' from tb1;

select lpad (rpad(id,length(id)+3,'*'),length(id)+6,'*') from tb1;

select substr('dush kumar',1,instr('dush kumar',' ',1,1)) as f_name,
substr('dush kumar',instr('dush kumar',' ',1,1)+1,length('dush kumar')-instr('dush kumar',' ',1,1)) as l_name
 from dual----name split 
 
 --split namby regexp_substr
 select regexp_substr('dushyant kumar','\w+',1,1)first_name,
 regexp_substr('dushyant kumar','\w+',1,2)second_name
  from dual
 

Select  ltrim('kumar@gmail.com',substr('kumar@gmail.com',1,instr('kumar@gmail.com','@')-1))as nd_name ,rtrim('kumar@gmail.com','@gmail.com')as st_name from dual;

select substr(a,1,instr(a,'@',1)-1) as first_name,
substr(a,instr(a,'@',1)+1,length(a)) as last_name from 
(select ('kumar@gmail.com')a from dual);
---------------------------------date-------------------------------------

create table e1 (id number(10),jdate date)

insert into e1 values(&id ,&jdate) 
select * from e1;

select jdate, to_char(jdate,'day month year') from e1;

select *  from e1 where jdate = '22-NOV-2011';
Select next_day('22-NOV-2011','sun')from dual;
---next day/last day-------------------------------------------------
select jdate,next_day(to_date(jdate,'dd-mon-yy'),'sun') from e1;
select last_day(to_date('24-dec-2006','dd-mon-yyyy'),'sun') from dual;

select jdate,last_day(to_date(jdate,'dd-mon-yy')) from e1;

select last_day(to_date(jdate),'sun') from e1; 

select jdate,concat (extract(day from sysdate) , extract(month from sysdate)-3, extract(year from sysdate)) from   e1;

----: extract ((year | month | day | hour | minute | second), date)---
select jdate,extract(day from jdate) from   e1;

select jdate, add_months(to_date(jdate), 5) from e1;

select jdate,next_day(to_date(jdate,'dd-mon-yy'),3) from e1;-----give numeric for days
 
select jdate,to_date(jdate+ (extract(day from jdate))),extract(day from jdate) from e1;---extract day + add any number of day

---------year ist day-------------------
select jdate,to_char(trunc(to_date(jdate,'dd-mon-yy'),'year'),'dd/mm/yyyy day') from e1;---year 1st day name
select jdate,to_date(jdate,'dd-mon-yy')+2 from e1;---year 1st day name

select jdate,trunc(to_date(jdate,'dd-mon-yy'),'year') from e1;


select to_char(to_date('24/dec/2006','dd/mon/yyyy'), 'dd * month * day') from dual;  --to get day name

---calculate dob-----------------

select round((sysdate - to_date('08-05-1992','dd-mm-yyyy'))/365)as year,
(extract (month from sysdate )-extract (month from trunc(to_date('08-09-1992','dd-mm-yyyy')))) as month,
(extract (day from sysdate )-extract (day from to_date('08-05-1992','dd-mm-yyyy'))) as day
from dual


select round((sysdate - to_date('08-05-1992','dd-mm-yyyy'))/365)as year,
12- extract ( month from to_date('08-05-1992','dd-mm-yyyy')) as month,
12- extract ( month from sysdate) as month

  
select trunc(months_between(sysdate,dob)/12) year,
          trunc(mod(months_between(sysdate,dob),12)) month,
         trunc(sysdate-add_months(dob,trunc(months_between(sysdate,dob)))) as day
  from (Select to_date('26051992','DDMMYYYY') dob from dual);  ---correct method


select trunc(months_between(sysdate,dob)/12) as year,
trunc(mod(months_between(sysdate,dob),12)) as month,
trunc(sysdate-add_months(dob,trunc(months_between(sysdate,dob)))) as day,
(extract(hour from cast(sysdate as timestamp))-(extract (hour from cast(dob as timestamp)))) as hour,
(extract(minute from cast(sysdate as timestamp))-(extract (minute from cast(dob as timestamp)))) as minute
from (select to_date('26051992','ddmmyyyy') dob from dual)---repeated

select trunc(months_between(sysdate,dob)/12) year,
trunc(mod(months_between(sysdate,dob),12)) month ,
trunc(sysdate-add_months(dob,trunc(months_between(sysdate,dob)))) day 
()hour from
 (select to_date('26-05-1992','dd-mm-yyyy')dob from dual)
 
 select abs(extract(hour from  cast(sysdate as timestamp))-extract(hour from  cast(dob as timestamp))) from
 (select to_date('29-08-2022 20:44:39','dd-mm-yyyy hh24:MI:SS')dob from dual) --- for 24 hour timestamp use hh24

select sysdate from dual
-----count special day between 2 dates---------

select * from e1

select round((sysdate-jdate)/7) as no_day, to_char(to_date(jdate,'dd-mm-yyyy'),'day') as day from e1
 
-------------set operator output----------------------
create table a1 (id number(8));
create table a2 (id number(8));

insert into a1 values(&id)
insert into a2 values(&id)
drop table a1
select * from a1
minus
select * from a2;
select * from a1  left outer join a2 on a1.id=a2.id;

-----------------delede duplicate----------------------------------
create table h1 (id number(8));
insert into h1 values(&id,&salary,&jdate,&address)
select * from h1
--1st method
select * from h1
delete from h1 where id in(
select id from h1 group by id,salary,jdate having count(id)>1 )--delete dupli all row

--2nd method
delete from h1 a where rowid > (select min(rowid) from h1 b  where b.id=a.id)


--3rd method
DELETE FROM h1 WHERE rowid NOT IN (SELECT Min(rowid) FROM h1 GROUP BY id);
  --or
  DELETE FROM h1 WHERE rowid NOT IN (SELECT Max(rowid) FROM h1 GROUP BY id);
  
-- 4th method  
  

-----------------duplicate-----------------------
select distinct id,salary,jdate from h1; ---distinctcd (1) row wise unique 


delete from h1 where id not in (select id from( ---for column level duplycacy
select * from h1  ---- by union get row wise unique data (2)
union 
select * from h1
))



select * from (
select id,salary,jdate, row_number() over( partition by id order by id desc) a from h1)
where a=1; ----by window function get id wise unique data (3)

select * from h1

select id, salary, jdate from h1 group by id,salary,jdate order by id ---by group by get row wise unique + column wise(4)

select * from h1 a where rowid > (select min(rowid) from h1 b where b.id=a.id) ---by rowid get column wise uniquenessb(5)




 -----------------remove-null /replace null--------------------------
 

 
 
-----------------------reverse---string------------------------
SELECT  reverse('firstname') FROM dual;


---------------------split string-----------------------------

select level from dual
connect by level<=4;

select level from dual
connect by level<4 ;

select n from
   ( select rownum n from dual connect by level <= 10)
   where n >= 5;

select * from(
select * from h1 order by id) where rownum >4

 
---split string
select substr('dush',level,1) from dual
connect by level<=length('dush');

----***** program 
select lpad('*',id,'*') from h1 where rownum<6


--split the name
select substr('dushyant',level,1) from dual
connect by level<=length('dushyant');

--count 

out ushing length fun
select count(substr('dushyant',rownum,1)) from dual
connect by rownum<=100;--1st dynamic math

select instr('dushyant','t',1) from dual--2nd static method

select instr(('dushyant')|| rpad(' ',1,' '),' ') from dual
select  instr('dushyant',' ') from dual

select regexp_substr('teambrainworks','t[^t]+m',1,1)col1,
       regexp_substr('teambrainworks','b[^b]+n',1,1)col2,
       regexp_substr('teambrainworks','w[^w]+',1,1)col3
from dual----split the nogap string by regexp

with a as(select * from h1 where regexp_like(salary,'[0-9]+'))

with b as (select * from h1 where regexp_like(salary,'[a-z]+'))

select a.col1, a.col2, a.col2 as salary, b.col2 as position from a ,b where a.col1=b.col1


-------------------highhest salary --------------------------
select * from h1 where salary in(
select max(salary) from h1
)--1st max

select * from h1 where salary in(
select max(salary) from h1 where
 salary<(select max(salary) from h1 where 
 salary<(select max(salary) from h1))) ---3rd max by nested
 
 
 SELECT * FROM h1 e1 WHERE 1 = (SELECT COUNT(DISTINCT salary) FROM h1 e2 WHERE e2.salary > e1.salary)

Read m
 
select * from 
(select id,salary,jdate, row_number() over(order by salary  )r from h1)
 where r=3; -- nth number max by row_number()
 
 
 select * from 
(select id,salary,jdate, row_number() over(order by salary  )r from h1)
 where r=3; -- nth number max by row_number() 
 
 select * from 
(select id,salary,jdate, rank() over(order by salary  )r from h1)
 where r=4;--nth max people by rank()----tie give same rank and next skip the rank

 select * from 
(select id,salary,jdate, dense_rank() over(order by salary  )r from h1)
 where r=3;--nth max by dense_rank ---tie give same rank and next give incrimintal rank
 
 with  t as
(select id,salary,jdate, dense_rank() over(order by salary  )r from h1)
select * from t where r=3;---with clause dense rank

--------department wise max salary
create table dep (id number(10),dname varchar2(18)) 







-------top10 record---------------------------------------------
 select * from 
(select id,salary,jdate, row_number() over(order by salary  )r from h1)
 where r<4;
-------last 10 record------------------------------------------ 
 select * from 
(select id,salary,jdate, row_number() over(order by salary desc )r from h1)
 where r<4;
---------middle reccord---------------------------------------

SELECT * FROM h1 WHERE ROWNUM <= (SELECT round(COUNT(*)/2) FROM h1)
     MINUS
    SELECT * FROM h1 WHERE ROWNUM<(SELECT COUNT(*)/2 FROM h1)



------ -------case & decode------ -- --------------------------
--'''Decode is faster than CASE.
--The Decode operation is done at storage Server level where the data
--is present BUT CASE is done at DB Instance level which receives data from DB storage Level.'''
select id,case id 
when 0 then 'start'
  when 6 then 'last'
    else 'no'
      end case
 ,salary,case salary
       when 1200 then 'min'
         when 30000 then 'min'
           when 35000 then 'average'
             when 40000 then 'high'
               else 'no comment'
                 end case,jdate
                 from h1----------case

select id ,decode(id,0,'start',4,'middle',6,'last','null') from h1---decode

----------update salary from anathor table -------------------------------------
create table s1 (id number(8),salary number(10));
create table s2 (id number(8),sname varchar2(20),salary number(10));

insert into s1 values(&id,&salary);
insert into s2 values(&id,&sname,&salary);


select * from s1
select * from s2

update s1 
set s1.salary = (select s2.salary from s1,s2 where s1.id=s2.id and s2.sname='ritu')
WHERE s1.id = (SELECT s2.id FROM s2 WHERE s2.sname = 'dushyant')---1st method

MERGE INTO table t1
USING
(
-- For more complicated queries you can use WITH clause here
SELECT * FROM table2
)t2
ON(t1.id = t2.id)
WHEN MATCHED THEN UPDATE SET
t1.name = t2.name,
t1.desc = t2.desc;

---------------connect by  level-----------------
select lpad('*',rownum,'*')from dual connect by rownum <=7;--we can use rownum vs level

select rpad('*',level,'*')from dual connect by level <=7;

select rpad('WELCOME',level) from dual connect by level<=length('WELCOME');

select lpad('*',7-level+1,'*') from dual connect by level<=7;

select lpad('WELCOME', length('WELCOME')-level+1) from dual connect by level<= length('WELCOME');

select lpad(' ',7-level,' ') || lpad('*',level,'*') pattern from dual connect by level<=7;

select lpad(' ',length('WELCOME')-level,' ') || lpad('WELCOME',level) pattern from dual connect by level<=length('WELCOME');

select lpad(' ',level-1,' ') || lpad('*',7-level+1,'*')pattern from dual connect by level <= 7;

select lpad('*',7-level+1,'*') || lpad('*',level*2-1,' ') || lpad('*',7-level,'*') star_pattern
    from dual connect by level <= 7
    union all
    select lpad('*',level,'*') || lpad('*',(7-level)*2+1,' ') || lpad('*',level-1,'*')
    from dual connect by level <= 7;
    
select lpad(' ',7-level+1,' ') || lpad('*',level*2-1,'*') diamond
    from dual connect by level <= 7;
    
select lpad(' ',level+1,' ') || lpad('*',(7-level)*2-1,'*') diamond
    from dual connect by level <= 7;
    
select lpad(' ',7-level+1,' ') || lpad('*',level*2-1,'*') diamond
    from dual connect by level <= 7
    union all
    select lpad(' ',level+1,' ') || lpad('*',(7-level)*2-1,'*') diamond
    from dual connect by level <= 7;
    
    
select lpad(' ',7-level,' ') || lpad('*',(level),'*') from dual---trangle 
connect by level <=7    
union all
select lpad(' ',level,' ') || lpad('*',(7-level),'*') from dual---diamond shape
connect by level <=7

------------------explane plan---------------------------------------------

explain plan  for

delete from h1 a where rowid > (select min(rowid) from h1 b  where b.id=a.id)

 
select plan_table_output
from table(dbms_xplan.display('plan_table',null,'basic +predicate +cost'));

-----------------create secquance--------------------
syntax
create sequence seq1
minvalue 1
start with 1
maxvalue 1000000
increment by 1
cache 10
nocycle 
 
create table tb1(id number(10),name varchar2(12),salary number(10))
 insert into tb1 values(seq1.nextval,&name,&salary)
 select * from tb1
 
 

 --------regexp expration--------------------


---
select * from tb1
select * from h1

REGEXP_SUBSTR('oracle', 'o r a c l e', 1, 1, 'x')

REGEXP_INSTR(email, '\w+@\w+(\.\w+)+') > 0

REGEXP_REPLACE(country_name, '(.)', '\1 ')

WHERE REGEXP_LIKE(first_name, '^Ste(v|ph)en$')
 
create table re (name varchar2(22),mail varchar2(30) )
drop table re
insert into re values(&name,&mail)
select * from re 
--------------regexp_like----------------------
SELECT name,mail
FROM re
WHERE REGEXP_LIKE (name, 'd$');--$ -mathch last character of string

SELECT name,mail
FROM re
WHERE REGEXP_LIKE (name, '[d-r]');--- string contain letter for to " - " for and " , "

SELECT name,mail
FROM re
WHERE REGEXP_LIKE (name, '^[d]'); --[ ] for range by " - " 


SELECT name,mail
FROM re
WHERE REGEXP_LIKE (name,'^d|^r|^z|a$') --" |  " pipe for and ," ^ " for first letter of string should be 

SELECT name,mail
FROM re
WHERE REGEXP_LIKE (name,'m{1}') -- use {int} for no of occurance of any char

---------------regexp_replace--------------------


 SELECT
  name,MAIL, 

  REGEXP_REPLACE( NAME,'\d{4}',  '**********' ) phone_number
FROM
 RE;   ----\d found digit {} specific position
 
 
 SELECT
  name,MAIL, 

  REGEXP_REPLACE( NAME,'\d{2}',  '**********' ) phone_number
FROM
 RE;
 
select regexp_replace('i am a boy','[[:blank:]]{1,3}','-') from dual

select regexp_replace
('9650387298','([[:digit:]]{3}) ([[:digit:]]{3}) ([[:digit:]]{4})',
'(\1) \2 \3'
) 
from dual

select regexp_like
('9650387298','([[:digit:]]{3}) ([[:digit:]]{3}) ([[:digit:]]{4})'
) 
from dual

SELECT name,mail
FROM re
WHERE REGEXP_LIKE (name,'^[0-9]{3}-[0-9]{3}-[0-9]{3}')

SELECT name,mail
FROM re
WHERE REGEXP_LIKE (name,'[@]')

select regexp_substr('ddjkh@gmail.com','[@][a-z.]+') from dual

select regexp_substr('574144/ytdgdg','[^[:digit:]]+$') from dual

select regexp_substr('57##%%4144/ytdgdg','[^[:alnum:]]+') from dual

select regexp_instr('57##%%4144/ytdgdg','#',1,1,1,'i') from dual

----create view ----its only virtually not contain physically table------for security, access controle-
select * from h1

create view h1_view as select * from h1

select * from h1_view

update h1_view set salary =5000 where id =1

---indexing----Clustered and nonclustered indexes described

--* primary and unique key index apply by default
CREATE INDEX h1_index
ON h1 (id, salary);

ALTER INDEX h1_index 
ON h1 REBUILD;

SELECT * FROM table1 IGNORE INDEX (col3_index)
WHERE col1=1 AND col2=2 AND col3=3;

select * from h1_index

DROP INDEX index_name;



--------------------merge------------for ETL---update or insert tablle value -------------

create table h2 as select * from h1   ---copy table

select * from h1
select * from h2

update h1 set salary=35000 where id =2  --- uypdate command

delete from h2 where id =2  ----deldte data


merge into h2
using (select * from h1---for unique record
minus
select * from h2) h1

on (h1.id=h2.id)
when not matched then 
  insert values(h1.id,h1.salary,h1.jdate)
  
when matched then
  update set h2.salary=h1.salary,h2.jdate=h1.jdate
  
  ;

-------------nested table---------------------------

create type location as object(city varchar2(30),pin number(6)) --type created

create type nest_table as table of location   ---type created

create table student (no number(3), name varchar2(19),address nest_table)
nested table address
store as student_temp;

create type location as object()
create type nest_table as table of location



insert into student values (1,'ram',nest_table(location('hyd',123131))); -- insert data into nested table

select * from student

select no,name,s.city,s.pin from student , table(student.address) s; -- fetch data from table


---------null filter from all column ---------
select * from h1
select id,salary from h1 group by id,salary having salary>1000

insert into h1 values (&id,&salary,&jdate)
select id,salary,jdate from h1 where id is not null and  salary is not null and jdate is not null
where id is not null 

---------------print 1 to 5------------------
select rownum from dual connect by rownum <6


---case statement use to meaningfull information

select case when salary is null then comm else salary from tab

--we can use coalesce

select colescec(salary,comm) from tab

----------------------circket run --------------------
create table cir (ball number(8),run number(3))
insert into cir values(&ball,&run)
select * from cir

select dense_rank() over (order by over) as over , run from( --1st method
select over,sum(run) as run from(
select rownum-replace(over,0,6)as over,run from(
select mod(ball,6)as over,run  from cir)) 
group by over
)



select ceil(ball/6)as over,sum(run) from cir group by ceil(ball/6) -- 2nd method


------------------
 create table student9(no number(2) unique); 
 insert into student9 values(&no)
 select * from student9

 create table stud(no number(2),no1 number(2)); 
 insert into stud values(&no,&no1)
 select * from stud
 select (no=no+no1) from stud
-------join-------------
 create table j3(no number(20),no1 number(20)); 
 create table j1(no number(20)); 
 
 select * from j
 select * from j1
 select * from j,j1 where j.no=j1.no(+)
  insert into j3 values(&no,&NO1)
  select * from j1,j where j1.no=j.no
select * from j
minus
select * from j natural join j1


select sqrt(2) from dual

select least(1,32,4) from dual

SELECT COALESCE(no,no1,122) from j3
SELECT nvl2(no,no1,122) from j3

select * from 
SELECT nvl(no,no1) from j3

select translate('kumar@gmail.com',regexp_substr('kumar@gmail.com','\w+',1),'*') from dual

select ('*') from dual 
connect by level

select round(198.48) from dual


select * from h1
---------------------------date-------
select * from h1 where jdate = '07-AUG-2022'

select * from h1 where to_char(jdate,'dd-mm-yyyy') = '07-08-2022'---ehrn we need to fetch data date wise
--- convert date into string format as per your requirment

select * from h1 where to_char(jdate,'dd-mm-yyyy') = '07-08-2022'
select * from h1 where jdate between '07-AUG-2020' and '07-AUG-2022'---date between

select abs(extract(second from  cast(current_timestamp as timestamp)))  from dual

select current_timestamp from dual

-------------------
select regexp_count('duaaashyant','a') from dual

select * from h1

with d as (
select id , sum(salary)m_expense from h1 where jdate = '09-AUG-20' group by id)

select id  from d where m_expense>(select avg((salary)) m_expense from h1 where jdate between  '09-AUG-20' and '30-AUG-20')


select id m_expense from h1 where jdate between  '09-AUG-20' and '30-AUG-20'

---------------last practic --------------------
-------spark withColumn------------------
select * from h1
select cast(id as float) from h1  ---cast the column data type


alter table h1 modify id number(20);---update column datatype by DDL (alter) command

alter table h1 add address varchar2(30)---add column in physical record by DDL(alter) command

alter table h1 drop column address  --- remove/drop/delete column 

select nvl(address,'ndl') from h1---add value in new column as a lit function in spark

--------------filter ------------------------

select * from h1 where id =1

--------------drop/delete duplicate record --row wise or column wise-----------
select distinct id,salary from h1 --it work on all column whatever give column after distinct 

select * from h1  where id is not null order by id desc----order by with null filter on column lelvel

select salary from h1 group by salary--group by 

select id , salary, count(salary) over(partition by id order by id )a from h1 group by id,salary -- we can apply partition and group by on same query


-------------------------------
create  h1_view on 
select * from h1

select count(manager_id),manager_id,department_id from hr.employees group by department_id,manager_id order by department_id
select count(gender) from 
(select department_id,manager_id,
case department_id
when 30 then 1
  when 60 then 2
      end gender
      from hr .employees) group by gender



select * from h1 where mod(id,2)!=0 and mod(id,3)!=0


select * from h1  pivot(jdate) for id in(2,3)) 


select * from h1 where (rowid,0) in (select rowid, mod(rownum,3) from h1)

select * from h1 where (id/2)=0

select * from h1 order by id 


select id,salary,jdate,((

 case when id is null then 1 else 0 end)+
   (case when id is null then 1 else 0 end)+
     (case when id is null then 1 else 0 end))
  
  count from h1
  select * from h1 where salary in(
  select max(salary) from (
  select id,salary,jdate,to_char(jdate ,'yy')mon from h1 )
  group by mon)
  
   select * from h1 where salary in(
  select max(salary) from (
  select id,salary,jdate,to_char(jdate ,'yy')mon from h1 )
  group by jdate)
  
  df.withColumn('nullcount',df(col)
  
  select avg(salary) from h1
  select count(substr('ritu','i')) from dual;
  
  select * from h1 where (id,salary)>
  (select id, avg(salary) from h1 group by rollup (id))
  
select avg(salary)as avsal from h1 where salary<(select max(salary)from h1 group by id) 


select * from 
(select id,salary,avg(salary) over(partition by id)a from h1)
where salary >a
  
 
select * from h1 where mod(id,2)!=0


select * from h1 where salary in (
select max(salary) from h1)

 create table n1 (id number(10), salary number(6), dept varchar2(16))
 insert into n1 values (&id,&salary,&dept)
 select * from n1
 
 insert into n1 values(1    ,10000,      'EC')
insert into n1 values(2,40000,      'EC')
insert into n1 values(3    ,30000,      'CS')
insert into n1 values(4    ,40000,      'ME')
insert into n1 values(5    ,50000,      'ME')
insert into n1 values(10    ,60000,      'ME')
insert into n1 values(8    ,70000,      'CS')

SELECT E.ID
FROM  n1 E
WHERE  EXISTS  (SELECT E2.salary
FROM n1 E2
WHERE E2.dept = 'CS'
AND   E.salary > E2.salary)

select * from n1

select rownum ,dept from n1 group by dept 

select * from (select r.*,row_number() over(partition by dept  order by salary desc)rnk from n1 r) 
where rnk=4

select * from (
select * from n1  order by salary desc)
where rownum<4

select * from(
select id, salary,dept,row_number() over(partition by dept order by salary desc) rnk from n1
)
where rnk =3

select "1" +1 from dual 
union
select 1 from dual

select 


