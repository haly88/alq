class CreateContratosItems < ActiveRecord::Migration
  def change
    create_table :contratos_items do |t|
      t.references :contrato, index: true, foreign_key: true
      t.date :fecha_desde
      t.date :fecha_hasta
      t.decimal :monto, :precision => 12, :scale => 4 
      t.decimal :saldo, :precision => 12, :scale => 4 

      t.timestamps null: false
    end
  end
end
