json.extract! order_product, :id, :orderes_id, :product_id, :value_total, :created_at, :updated_at
json.url order_product_url(order_product, format: :json)
