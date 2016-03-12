json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :company_id
  json.url invoice_url(invoice, format: :json)
end
