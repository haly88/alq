json.array!(@contratos) do |contrato|
  json.extract! contrato, :id, :codigo, :nombre, :activo, :descripcion, :carpeta, :fecha
  json.url contrato_url(contrato, format: :json)
end
