class ChangePropietarioInPagos < ActiveRecord::Migration
  def change
  	remove_column :pagos, :propietario_id_id
  	add_column :pagos, :propietario_id, :integer
  end
end
