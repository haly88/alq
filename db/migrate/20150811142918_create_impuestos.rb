class CreateImpuestos < ActiveRecord::Migration
  def change
    create_table :impuestos do |t|
      t.string :codigo
      t.string :nombre
      t.text :descripcion
      t.integer :cantidad_meses_defecto

      t.timestamps null: false
    end
  end
end
