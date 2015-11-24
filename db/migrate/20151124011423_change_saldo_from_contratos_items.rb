class ChangeSaldoFromContratosItems < ActiveRecord::Migration
  def change
  	change_column :contratos_items, :saldo, :decimal, :precision => 12, :scale => 4, default: 0
  end
end
