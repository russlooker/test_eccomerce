- view: orders
  sql_table_name: public.orders
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: traffic_source
    type: string
    sql: ${TABLE}.traffic_source

  - dimension: user_id
    type: number
    # hidden: true
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: other_set*

  sets: 
    detail: 
      - id
      - created_date
      - status
      - traffic_source
      
    other_set:
      - id
      - order_items.count
      
      
      
      
      