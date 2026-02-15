select count(*) as total_delivered_orders,
		sum(case 
				when order_delivered_customer_date<=order_estimated_delivery_date
                then 1
                else 0
			end) as on_time_orders,
		round(
			100.0*
            sum(case 
				when order_delivered_customer_date<=order_estimated_delivery_date
                then 1
                else 0
			end)/count(*)
            ,2) as on_time_delivery_percentage
from demo.olist_orders_dataset
where order_status='delivered'
and order_delivered_customer_date is not null;