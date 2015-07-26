class CreateInmuebleTipos < ActiveRecord::Migration
  def change
    create_table :inmueble_tipos do |t|
      t.string :codigo
      t.string :nombre

      t.timestamps null: false
    end
  end
end
