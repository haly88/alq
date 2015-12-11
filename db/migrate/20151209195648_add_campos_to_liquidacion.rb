class AddCamposToLiquidacion < ActiveRecord::Migration
  def change
    add_column :liquidaciones, :mora, :decimal, :precision => 12, :scale => 4
    remove_column :liquidaciones, :propietario_id
    remove_column :liquidaciones, :comision
  end
end
