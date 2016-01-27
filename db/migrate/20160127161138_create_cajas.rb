class CreateCajas < ActiveRecord::Migration
  def change
    create_table :cajas do |t|
      t.string :codigo
      t.string :nombre
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
