class AddCamposToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :piso, :string
    add_column :personas, :depto, :string
  end
end
