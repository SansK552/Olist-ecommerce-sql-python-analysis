create view demo.olist_analytical_dataset as
select
    o.order_id,
    o.customer_id,
    c.customer_city,
    c.customer_state,
    
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    
    r.review_score,
    r.review_creation_date,
    r.review_answer_timestamp,
    
    i.product_id,
    pr.product_category_name,
    pr.product_weight_g,
    
    i.price,
    i.freight_value,
    
    pay.payment_type,
    pay.payment_installments,
    pay.payment_value

from demo.olist_orders_dataset o

join demo.olist_customers_dataset c
    on o.customer_id = c.customer_id

left join demo.olist_order_reviews r
    on o.order_id = r.order_id

join demo.olist_order_items_dataset i
    on o.order_id = i.order_id

join demo.olist_products_dataset pr
    on i.product_id = pr.product_id

left join demo.olist_order_payments_dataset pay
    on o.order_id = pay.order_id

where o.order_status = 'delivered';
