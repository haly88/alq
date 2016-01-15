class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.references :contrato, index: true, foreign_key: true
      t.references :contratos_item, index: true, foreign_key: true
      t.references :propietario_id, :integer
      t.references :liquidacion, index: true, foreign_key: true
      t.date :fecha
      t.decimal :neto, :precision => 12, :scale => 4, :default => 0, :null => false
      t.decimal :comision, :precision => 12, :scale => 4, :default => 0, :null => false
      t.decimal :descuento, :precision => 12, :scale => 4, :default => 0, :null => false
      t.decimal :total, :precision => 12, :scale => 4, :default => 0, :null => false

      t.timestamps null: false
    end
  end
end
