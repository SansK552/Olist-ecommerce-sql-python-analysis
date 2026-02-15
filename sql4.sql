select count(*) as number_of_instances,
		payment_type,
        round(
			100.0*count(*)/(
						select count(*)
                        from demo.olist_order_payments_dataset
                        )
			  ,2) as percentage_usage
from demo.olist_order_payments_dataset
group by payment_type
order by number_of_instances;