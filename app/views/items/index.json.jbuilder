json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :price, :quantity, :invoice_id
  json.url item_url(item, format: :json)
end
