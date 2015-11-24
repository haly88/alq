class AddContratoItemsToLiquidacion < ActiveRecord::Migration
  def change
    add_reference :liquidaciones, :contratos_item, index: true, foreign_key: true
  end
end
