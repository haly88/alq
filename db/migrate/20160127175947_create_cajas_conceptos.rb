class CreateCajasConceptos < ActiveRecord::Migration
  def change
    create_table :cajas_conceptos do |t|
      t.string :codigo
      t.string :nombre
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
