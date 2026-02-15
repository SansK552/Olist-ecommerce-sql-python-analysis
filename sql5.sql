select c.customer_city as city,
		c.customer_state as state,
        count(r.review_id) as total_reviews,
        round(
			  avg(r.review_score)
              ,2) as avg_review_score
from demo.olist_customers_dataset c
join demo.olist_orders_dataset o 
	on c.customer_id=o.customer_id
join demo.olist_order_reviews r
	on o.order_id=r.order_id
where o.order_status='delivered'
group by c.customer_city, c.customer_state
having count(r.review_id)>=20
order by avg_review_score desc;