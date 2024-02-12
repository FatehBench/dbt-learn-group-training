<<<<<<< HEAD
with 

customers as (

    select * from {{ ref('stg_customers')}}
=======
with customers as (

    select
        id as customer_id,
        first_name,
        last_name

    from raw.jaffle_shop.customers
>>>>>>> 9abc25bc6a5344daa29bc3a81399828a061ae2f7

),

orders as (

<<<<<<< HEAD
    select * from {{ ref('orders')}}
=======
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status,
        _etl_loaded_at

    from raw.jaffle_shop.orders
>>>>>>> 9abc25bc6a5344daa29bc3a81399828a061ae2f7

),

customer_orders as (

    select
        customer_id,
<<<<<<< HEAD
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value

    from orders
=======

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

>>>>>>> 9abc25bc6a5344daa29bc3a81399828a061ae2f7
    group by 1

),

<<<<<<< HEAD
=======

>>>>>>> 9abc25bc6a5344daa29bc3a81399828a061ae2f7
final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
<<<<<<< HEAD
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        customer_orders.lifetime_value

    from customers
=======
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

>>>>>>> 9abc25bc6a5344daa29bc3a81399828a061ae2f7
    left join customer_orders using (customer_id)

)

<<<<<<< HEAD
select * from final
=======
select * from final
>>>>>>> 9abc25bc6a5344daa29bc3a81399828a061ae2f7
