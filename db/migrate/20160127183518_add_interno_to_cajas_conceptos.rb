class AddInternoToCajasConceptos < ActiveRecord::Migration
  def change
    add_column :cajas_conceptos, :interno, :boolean, :default => false
  end
end
