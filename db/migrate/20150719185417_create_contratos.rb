class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.string :codigo
      t.string :nombre
      t.boolean :activo, :default => true
      t.string :descripcion
      t.string :carpeta
      t.date :fecha

      t.timestamps null: false
    end
  end
end
