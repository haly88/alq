class AddPersonaToLiquidaciones < ActiveRecord::Migration
  def change
    add_column :liquidaciones, :inquilino_id, :integer
    add_column :liquidaciones, :propietario_id, :integer
  end
end
