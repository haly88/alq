class AddSelladoToContrato < ActiveRecord::Migration
  def change
    add_column :contratos, :sellado, :boolean
  end
end
