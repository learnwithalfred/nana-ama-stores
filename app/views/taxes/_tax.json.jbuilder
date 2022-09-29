json.extract! tax, :id, :user_id, :name, :description, :period, :amount, :created_at, :updated_at
json.url tax_url(tax, format: :json)
