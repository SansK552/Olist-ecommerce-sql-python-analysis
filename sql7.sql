select round(
			sum(i.price)
            ,2) as product_revenue,
		pr.product_category_name as category
from demo.olist_order_items_dataset i 
join demo.olist_products_dataset pr
	on i.product_id=pr.product_id
group by pr.product_category_name
order by product_revenue desc;