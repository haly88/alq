class CreateContratosImpuestos < ActiveRecord::Migration
  def change
    create_table :contratos_impuestos do |t|
      t.references :contrato, index: true, foreign_key: true
      t.references :impuesto, index: true, foreign_key: true
      t.decimal :monto, :precision => 12, :scale => 4
      t.date :fecha_vencimiento
      t.date :fecha_pago
      t.boolean :pago

      t.timestamps null: false
    end
  end
end
