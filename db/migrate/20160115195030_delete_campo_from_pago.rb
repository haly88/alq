class DeleteCampoFromPago < ActiveRecord::Migration
  def change
  	remove_column :pagos, :integer_id
  end
end
