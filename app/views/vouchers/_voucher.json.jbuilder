json.extract! voucher, :id, :voucher_code, :voucher_type, :voucher_value, :voucher_value_remaining, :created_at, :updated_at
json.url voucher_url(voucher, format: :json)
