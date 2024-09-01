select * from sql_ck_live.users t1
cross join sql_ck_live.groups;
--inner
select * from sql_ck_live.users t1
inner join sql_ck_live.membership t2 
on t1.user_id=t2.user_id
--left
select * from sql_ck_live.membership t1
left join sql_ck_live.users t2
on t1.user_id=t2.user_id
--right
select * from sql_ck_live.membership t1
right join sql_ck_live.users t2
on t1.user_id=t2.user_id
--full
select * from sql_ck_live.users t1
left join sql_ck_live.membership t2
on t1.user_id=t2.user_id
union 
select * from sql_ck_live.users t1
right join sql_ck_live.membership t2
on t1.user_id=t2.user_id

-- set

select * from sql_ck_live.person1
union 
select * from sql_ck_live.person2

select * from sql_ck_live.person1
union all 
select * from sql_ck_live.person2

select * from sql_ck_live.person1
intersect
select * from sql_ck_live.person2

select * from sql_ck_live.person1
except 
select * from sql_ck_live.person2

select * from sql_ck_live.users1 t1
join sql_ck_live.users1 t2
on t1.user_id=t2.emergency_contact

select * from sql_ck_live.students t1
join sql_ck_live.class t2
on t1.class_id=t2.class_id AND t1.enrollment_year=t2.class_year

select * from flipkart.order_details t1
join flipkart.orders t2
on t1.order_id=t2.order_id
join flipkart.users t3
on t2.user_id=t3.user_id

select t1.order_id,t1.amount,t1.profit,t3.name from flipkart.order_details t1
join flipkart.orders t2
on t1.order_id=t2.order_id
join flipkart.users t3
on t2.user_id=t3.user_id

select t2.order_id,t1.name,t1.city from flipkart.users t1
join flipkart.orders t2
on t1.user_id=t2.user_id

select t2.order_id , t1.vertical 
from flipkart.category t1
join flipkart.order_details t2
on t1.category_id=t2.category_id

select * from flipkart.orders t1
join flipkart.users t2
on t1.user_id=t2.user_id
where t2.city='pune'

select * from flipkart.orders t1
join flipkart.users t2
on t1.user_id=t2.user_id
join flipkart.order_details t3
on t1.order_id=t3.order_id
where t2.city='pune'

select * from flipkart.order_details t1
join flipkart.category t2
on t1.category_id=t2.category_id
where t2.vertical='chairs'

select t2.order_id,sum(t1.profit) as 'total_profit' from flipkart.order_details t1
join flipkart.orders t2
on t1.order_id=t2.order_id
group by t1.order_id
having total_profit>0

select t2.name ,count(t1.order_id) as 'total_pro' from flipkart.orders t1
join flipkart.users t2
on t1.user_id=t2.user_id
group by t2.name
order by total_pro desc
limit 1

select t2.vertical,sum(t1.profit) as 'toatl_pro'  
from flipkart.order_details t1
join flipkart.category t2
on t1.category_id=t2.category_id
group by t2.vertical
order by toatl_pro desc
limit 1

select t2.state,sum(t3.profit)  as 'total_state_profit'
from flipkart.orders t1
join flipkart.users t2
on t1.user_id=t2.user_id
join flipkart.order_details t3
on t3.order_id=t1.order_id
group by t2.state
order by total_state_profit desc 
limit 1

select t2.vertical,sum(t1.profit) as 'total_pro'
from flipkart.order_details t1
join flipkart.category t2
on t1.category_id=t2.category_id
group by t2.vertical
having total_pro>5000

