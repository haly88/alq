class ChangeFieldsToEmpresa < ActiveRecord::Migration
  def change
		change_column :empresas, :mora_fija_dia, :integer, :default => 0, :null => false
    change_column :empresas, :mora_fija_monto, :decimal, :precision => 12, :scale => 4, :default => 0, :null => false
    change_column :empresas, :mora_fija_porc, :decimal, :precision => 12, :scale => 4, :default => 0, :null => false
    change_column :empresas, :mora_var_dia, :integer, :default => 0, :null => false
    change_column :empresas, :mora_var_monto, :decimal, :precision => 12, :scale => 4, :default => 0, :null => false
    change_column :empresas, :mora_var_porc, :decimal, :precision => 12, :scale => 4, :default => 0, :null => false
  end
end
