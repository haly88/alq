json.array!(@personas) do |persona|
  json.extract! persona, :id, :codigo, :nombre, :activo, :descripcion, :es_inquilino, :es_propietario, :es_garante, :es_otro, :telefono, :email, :direccion
  json.url persona_url(persona, format: :json)
end
