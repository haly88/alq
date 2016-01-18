class AddDescripcionToPagosLiquidaciones < ActiveRecord::Migration
  def change
    add_column :pagos, :descripcion, :text
    add_column :liquidaciones, :descripcion, :text
  end
end
