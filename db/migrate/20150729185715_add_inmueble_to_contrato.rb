class AddInmuebleToContrato < ActiveRecord::Migration
  def change
    add_reference :contratos, :inmueble, index: true, foreign_key: true
  end
end
