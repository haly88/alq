class AddCajaToContratos < ActiveRecord::Migration
  def change
    add_reference :contratos, :caja, index: true, foreign_key: true, :default => 1
  end
end
