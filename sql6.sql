select review_score,
		round(
			  avg(
				   datediff(
					review_answer_timestamp,
                    review_creation_date
                    )
				  )
			  ,2) as avg_diff_days
from demo.olist_order_reviews
where review_answer_timestamp is not null
group by review_score
order by review_score;