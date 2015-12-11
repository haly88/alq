class AddCamposToEmpresa < ActiveRecord::Migration
  def change
    add_column :empresas, :mora_fija_dia, :integer
    add_column :empresas, :mora_fija_monto, :decimal, :precision => 12, :scale => 4
    add_column :empresas, :mora_fija_porc, :decimal, :precision => 12, :scale => 4
    add_column :empresas, :mora_var_dia, :integer
    add_column :empresas, :mora_var_monto, :decimal, :precision => 12, :scale => 4
    add_column :empresas, :mora_var_porc, :decimal, :precision => 12, :scale => 4
  end
end
