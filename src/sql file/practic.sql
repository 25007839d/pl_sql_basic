create table school(course varchar2(20),
faculty_name varchar2(30),
section number(20),
salary number(6));

select * from school;
select salary from school where salary= max(salary)from school;

insert into school values('bcom','rahul','1','10000');
insert into school values('bcom','Rekha','1','70000');
insert into school values('bcom','chinki','1','10000');
insert into school values('bcom','atul','2','90000');
insert into school values('bcom','ritu','2','200000');

create table logistic2(item_no number(10), item_name varchar2(30),item_quantity number(7),receiving_date date,receiving_time timestamp,
peritem_cost float,total_ite_cost float,respected_department varchar2(30),department_code number(4),plant_code varchar2(4),
receiver_name varchar2(30),receiver_token_no number(10),supplier_id varchar2(8));

update logistic1 set receiver_name where eceiver_name varchar2(20);


`````````        

insert into logistic2 values('102','bolt','1000',to_date('23.01.2022','dd-mm-yyyy'),to_date('04.12.21','hh24:mi:ss'),'8','8000','assembly',
'0211','ma01','dushyant','123456262','suprio');
insert into logistic2 values('103','bolt','1007',to_date('25.01.2022','dd-mm-yyyy'),to_date('17.12.21','hh24:mi:ss'),'8','8000','assembly',
'0211','ma01','shyam','123456262','tuprio');



schema M_company


 create table logistic3(item_no number(10), item_name varchar2(30),item_quantity number(7),receiving_date date,receiving_time varchar(20),
peritem_cost float,total_ite_cost float,respected_department varchar2(30),department_code number(4),plant_code varchar2(4),
receiver_name varchar2(30),receiver_token_no number(10),supplier_id varchar2(8));

alter table logistic3 add reciving_no varchar2(8);


select * from logistic3;

insert into logistic3 values('102','bolt','1000',sysdate,to_char(sysdate,'hh24:mi:ss'),'8','8000','assembly',
'0211','ma01','dushyant','123456262','suprio');
insert into logistic3 values('102','bolt','1000',to_date(sysdate),to_char(sysdate,'hh24:mi:ss'),'8','8000','assembly',
'0211','ma01','dushyant','123456262','suprio');

insert into logistic3 values(&item_no), &item_name,&item_quantity,
&peritem_cost,&total_ite_cost,&respected_department,&department_code,&plant_code,
&receiver_name,&receiver_token_no,&supplier_id);


insert into logistic3 values(&item_no);

