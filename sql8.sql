select 
		pr.product_category_name as category,
        count(distinct r.review_id) as total_reviews,
		round(
			avg(r.review_score)
            ,2) as avg_review_score,
		round(
			sum(i.price)
            ,2) as product_revenue
from demo.olist_order_reviews r
join demo.olist_orders_dataset o
	on r.order_id=o.order_id
join demo.olist_order_items_dataset i
	on r.order_id=i.order_id
join demo.olist_products_dataset pr
	on i.product_id=pr.product_id
where o.order_status='delivered'
group by pr.product_category_name
having count(distinct r.review_id)>=30
order by avg_review_score asc;