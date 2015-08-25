class CreateLiquidaciones < ActiveRecord::Migration
  def change
    create_table :liquidaciones do |t|
      t.references :contrato, index: true, foreign_key: true
      t.date :fecha
      t.decimal :neto, :precision => 12, :scale => 4
      t.decimal :descuento, :precision => 12, :scale => 4
      t.decimal :comision, :precision => 12, :scale => 4
      t.decimal :total, :precision => 12, :scale => 4

      t.timestamps null: false
    end
  end
end
