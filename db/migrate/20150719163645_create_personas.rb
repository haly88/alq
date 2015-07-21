class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :codigo
      t.string :nombre
      t.boolean :activo
      t.text :descripcion
      t.boolean :es_inquilino
      t.boolean :es_propietario
      t.boolean :es_garante
      t.boolean :es_otro
      t.string :telefono
      t.string :email
      t.string :direccion

      t.timestamps null: false
    end
  end
end
