create table calc(uid int, loadtime Date);

insert into calc values(201,"2017/1/1");
insert into calc values(201,'2017/1/2');
insert into calc values(201,'2017/1/3');
insert into calc values(202,'2017/1/1');
insert into calc values(202,'2017/1/5');
insert into calc values(203,'2017/1/1');
insert into calc values(203,'2017/1/2');
insert into calc values(203,'2017/1/3');
insert into calc values(203,'2017/1/4');

select uid,loadtime,row_number()over(partition by UID order by loadtime) sort
from calc;
