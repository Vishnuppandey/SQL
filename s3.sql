select * from users where user_id not in (select distinct(user_id) from orders)
use sql_ck_live
select * from sql_ck_live.movies where director in (select * from top_directors)

with top_directors as (select director from sql_ck_live.movies group by director order by sum(gross) desc limit 3)

select * from movies where star in (select star from movies where votes>25000 group by star having avg(score)>8.5)

select * from movies where (year,gross-budget) in 
                                             (select year ,max(gross-budget) 
                                             from movies group by year) 
select * from movies where (genre,score) in 
                                        (select genre,max(score) as 'max_rating' 
                                        from movies where votes>25000 group by genre )   
 AND votes>25000    
 
 with top_duos as (
  select star,director ,sum(gross) 
  from movies 
  group by star,director
  order by sum(gross) desc
 )
 select * from movies where (star,director,gross) in 
                                      (top_duos) limit 5

select * from movies m1 where score > (select avg(score) from movies m2 where m1.genre=m2.genre)

select * from zomato.food
use zomato

select t1.name,t4.f_name,count(*) as 'frequency' from users t1
join orders t2 on t1.user_id=t2.user_id
join order_details t3 on t3.order_id=t2.order_id
join food t4 on t4.f_id=t3.f_id 
group by t1.name,t4.f_name, t2.user_id,t3.f_id

WITH food_de AS (
    SELECT 
        t2.user_id,
        t1.name,
        t4.f_name,
        COUNT(*) as frequency
    FROM 
        users t1
    JOIN 
        orders t2 ON t1.user_id = t2.user_id
    JOIN 
        order_details t3 ON t3.order_id = t2.order_id
    JOIN 
        food t4 ON t4.f_id = t3.f_id 
    GROUP BY 
        t1.name,
        t4.f_name, 
        t2.user_id,
        t3.f_id
)
SELECT * from food_de f1 where frequency=(select max(frequency) from food_de f2 where f2.user_id=f1.user_id) order by user_id

use sql_ck_live
select name,(votes/(select sum(votes) from sql_ck_live.movies))*100 from sql_ck_live.movies 

select name,genre,score,(score/(select avg(score) from movies m2 where m1.genre=m2.genre)) as 'genre scoere' from movies m1
use zomato
select * from zomato.restaurants


select r_name,avg_rating from(select r_id,avg(restaurant_rating) as 'avg_rating' from orders group by r_id) t1 join restaurants t2 on t1.r_id=t2.r_id

