select c.customer_state,
	   round(
			avg(
				datediff(
						o.order_delivered_customer_date,
                        o.order_estimated_delivery_date)
				)
			,2) as avg_delay_days,
		round(
			100.0*
            sum(case 
					when o.order_delivered_customer_date>o.order_estimated_delivery_date
					then 1
					else 0
			end)/count(*)
            ,2) as late_delivery_percentage
from demo.olist_orders_dataset o
join demo.olist_customers_dataset c on o.customer_id=c.customer_id
where o.order_status='delivered'
and o.order_delivered_customer_date is not null
group by c.customer_state
order by avg_delay_days desc;