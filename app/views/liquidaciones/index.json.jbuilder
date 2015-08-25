json.array!(@liquidaciones) do |liquidacion|
  json.extract! liquidacion, :id, :contrato_id, :fecha, :neto, :descuento, :comision, :total
  json.url liquidacion_url(liquidacion, format: :json)
end
