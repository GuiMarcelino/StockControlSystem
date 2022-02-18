json.extract! product, :id, :name, :description, :amount, :due_date, :value_buy, :value_sale, :created_at, :updated_at
json.url product_url(product, format: :json)
