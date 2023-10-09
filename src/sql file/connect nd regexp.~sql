select eid_pk,ename,sys_connect_by_path(ename,'/') pathv
from employee_tab5
start with ename='duahyant'
connect by prior eID_PK=ejob

select eid_pk,ename || '==>' || prior ename, level from employee_tab5 
start with ename = 'DUSHYANT'
connect by prior eid_pk= ejob;

  ----regexp_like
  
  select * from employee_tab5 where regexp_xp(ename,'d');
