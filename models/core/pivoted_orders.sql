{% set payment_methods = dbt_utils.get_column_values(table=ref('stg_payments'), column='payment_method') -%}

select 
    order_id,
    {% for payment_method in payment_methods -%}
    sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as amount_{{ payment_method }}
    {%- if not loop.last -%}, {% endif %}
    {% endfor %}
from {{ ref('stg_payments') }}
group by order_id