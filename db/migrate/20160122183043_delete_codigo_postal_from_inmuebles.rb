class DeleteCodigoPostalFromInmuebles < ActiveRecord::Migration
  def change
  	remove_column :inmuebles, :codigo_postal
  end
end
