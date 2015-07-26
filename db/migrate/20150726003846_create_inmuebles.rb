class CreateInmuebles < ActiveRecord::Migration
  def change
    create_table :inmuebles do |t|
      t.string :codigo
      t.string :descripcion
      t.boolean :activo, :default => true
      t.references :inmueble_tipo, index: true, foreign_key: true
      t.string :direccion
      t.string :piso
      t.string :depto
      t.string :localidad
      t.string :codigo_postal
      t.string :administracion
      t.string :adm_email
      t.string :adm_tel1
      t.string :adm_tel2
      t.string :adm_tel3
      t.string :encargado
      t.string :enc_email
      t.string :enc_tel1
      t.string :enc_tel2
      t.string :enc_tel3

      t.timestamps null: false
    end
  end
end
