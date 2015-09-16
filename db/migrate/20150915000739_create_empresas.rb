class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.string :razon_social
      t.string :direccion
      t.string :piso
      t.string :depto
      t.string :telefono
      t.string :email

      t.timestamps null: false
    end
  end
end
