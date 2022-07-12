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

select uid, loadtime, row_number() over(partition by uid order by loadtime) as sort
from calc;

select uid, date_sub(loadtime, sort) as same_start, count() as daycount
from (select uid, loadtime, row_number() over(partition by uid order by loadtime) as sort
      from calc) t;
group by uid,same_start

Select uid, max(daycount) as maxdays
from (select uid, date_sub(loadtime, sort) as same_start, count() as daycount
    from (select uid, loadtime, row_number() over(partition by uid order by loadtime) as sort
          from calc) t;
    group by uid,same_start) b
group by uid

