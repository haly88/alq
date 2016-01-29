class CreateMovimientos < ActiveRecord::Migration
  def change
    create_table :movimientos do |t|
      t.references :caja, index: true, foreign_key: true
      t.date :fecha
      t.references :cajas_concepto, index: true, foreign_key: true
      t.text :descripcion
      t.decimal :monto, :precision => 12, :scale => 4, :default => 0, :null => false

      t.timestamps null: false
    end
  end
end
