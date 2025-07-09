{{
    config(
    materialized = "table"
    )
}}


{{generate_profit_table('sales_us')}}