class AddComisionToEmpresa < ActiveRecord::Migration
  def change
    add_column :empresas, :comision_monto, :decimal, :precision => 12, :scale => 4, :default => 0, :null => false
    add_column :empresas, :comision_porc, :decimal, :precision => 12, :scale => 4, :default => 0, :null => false
  end
end
