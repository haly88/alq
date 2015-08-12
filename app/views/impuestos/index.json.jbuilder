json.array!(@impuestos) do |impuesto|
  json.extract! impuesto, :id, :codigo, :nombre, :descripcion, :cantidad_meses_defecto
  json.url impuesto_url(impuesto, format: :json)
end
