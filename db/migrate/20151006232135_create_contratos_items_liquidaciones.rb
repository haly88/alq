class CreateContratosItemsLiquidaciones < ActiveRecord::Migration
  def change
    create_table :contratos_items_liquidaciones do |t|
      t.references :contratos_item, index: true, foreign_key: true
      t.references :liquidacion, index: true, foreign_key: true
      t.decimal :pendiente, :precision => 12, :scale => 4

      t.timestamps null: false
    end
  end
end
