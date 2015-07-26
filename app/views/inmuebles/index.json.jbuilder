json.array!(@inmuebles) do |inmueble|
  json.extract! inmueble, :id, :codigo, :descripcion, :activo, :inmueble_tipo_id, :direccion, :piso, :depto, :localidad, :codigo_postal, :administracion, :adm_email, :adm_tel1, :adm_tel2, :adm_tel3, :encargado, :enc_email, :enc_tel1, :enc_tel2, :enc_tel3
  json.url inmueble_url(inmueble, format: :json)
end
