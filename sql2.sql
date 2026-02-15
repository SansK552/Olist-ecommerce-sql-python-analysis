select date(order_delivered_customer_date) as delivery_date,
	   round(
			avg(
				datediff(
						order_delivered_customer_date,
                        order_estimated_delivery_date)
				)
			,2) as avg_late_delay_days
from demo.olist_orders_dataset
where order_status='delivered'
and order_delivered_customer_date>order_estimated_delivery_date
group by date(order_delivered_customer_date)
order by delivery_date;