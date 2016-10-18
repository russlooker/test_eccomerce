- connection: red_look

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# - explore: order_items
#   joins:
#     - join: orders
#       sql_on: ${orders.id} = ${order_items.order_id}
#     - join: users
#       sql_on: ${users.id} = ${orders.user_id}


- explore: order_items
  joins:
    - join: orders
      type: left_outer
      relationship: many_to_one
      sql_on: ${order_items.order_id} = ${orders.id}
    - join: users
      type: left_outer
      relationship: many_to_one
      sql_on: ${users.id} = ${orders.user_id}
      
      
- explore: calendar_table
  sql_always_where: ${calendar_table.date_date} <= current_date
  joins:
    - join: orders
      type: left_outer
      relationship: one_to_many
      sql_on: ${calendar_table.date_date}  = ${orders.created_date}
    - join: order_items
      relationship: one_to_many
      type: left_outer
      sql_on: ${order_items.returned_date} = ${calendar_table.date_date}
  
      