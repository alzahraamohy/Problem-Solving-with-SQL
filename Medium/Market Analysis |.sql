-- https://leetcode.com/problems/market-analysis-i/description/
select u.user_id as buyer_id, u.join_date,
       count(distinct o.order_id) as orders_in_2019

from Users u
left join Orders o
on o.buyer_id = u.user_id and year(o.order_date)='2019' 
group by u.user_id
