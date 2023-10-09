

select * from employee_tab5
select ename ,eid_pk,nvl(esal,0)as total_sal from employee_tab5
select ename,ejob,nvl(esal,0) as total_sal from employee_tab5

create table xyz (en varchar2(3),ename varchar2(20),esal varchar2(8),ecomm varchar2(3));
select * from xyz
insert into xyz values (1,'rahul',25000,12);
insert into xyz values (1,'rocky',25000,10);
insert into xyz values (1,'anika',25000, null);
insert into xyz values (1,'joty',25000,12);
insert into xyz values (1,'rachi',28000,132);

select ename ,12*(esal)+nvl(ecomm,0) from xyz

select username from all_users;

select nvl(esal,0) from employee_tab5
select count(nvl(esal,0)) from employee_tab5

select tname from tab;

select * from ALL_MVIEW_K
 show users;

select trunc(123,-1), trunc(123,-2), trunc(123,-3), trunc(-123,-1), trunc(-123,2),
trunc(-123,-3) from dual;

select trunc(20.19,1) from dual;
select RTRIM('APPLE',3,*) from dual;


select ('gfgf'||'ffff') from dual
select substr('computer',2), substr('computer',2,5), substr('computer',3,7) from
dual;

