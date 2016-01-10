class AddTipoToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :tipo, :string
    remove_column :personas, :es_inquilino
    remove_column :personas, :es_propietario
    remove_column :personas, :es_garante
    remove_column :personas, :es_otro
  end
end
