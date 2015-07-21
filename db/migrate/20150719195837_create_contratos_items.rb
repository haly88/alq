class CreateContratosItems < ActiveRecord::Migration
  def change
    create_table :contratos_items do |t|
      t.references :contrato, index: true, foreign_key: true
      t.date :fecha_desde
      t.date :fecha_hasta
      t.decimal :monto

      t.timestamps null: false
    end
  end
end
