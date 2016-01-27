json.array!(@caja) do |caja|
  json.extract! caja, :id, :codigo, :nombre, :descripcion
  json.url caja_url(caja, format: :json)
end
