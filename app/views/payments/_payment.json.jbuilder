json.extract! payment, :id, :author_id, :amount, :store_id, :payee, :payment_complete, :balance, :arrears, :tax_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
