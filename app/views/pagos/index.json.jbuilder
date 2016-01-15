json.array!(@pagos) do |pago|
  json.extract! pago, :id, :contrato_id, :fecha, :neto, :descuento, :comision, :total
  json.url pago_url(pago, format: :json)
end
