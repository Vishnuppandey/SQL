select name, gross-budget as 'profit' from sql_ck_live.movies where gross-budget = (select gross-budget as 'profit'  from sql_ck_live.movies order by profit desc limit 1)
use sql_ck_live
select * from movies where gross-budget=(select max(gross-budget) from movies)

select count(*) from movies where score > (select avg(score) from movies)

select * from movies where year=2000 and score=
(select max(score) from movies where year=2000)

select * from movies where score=(select max(score) from movies where votes>(select avg(votes) from movies)) 

create database zomato
