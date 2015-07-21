class CreateContratosPersonasTipos < ActiveRecord::Migration
  def change
    create_table :contratos_personas_tipos do |t|
      t.references :contrato, index: true, foreign_key: true
      t.integer :inquilino_id
      t.integer :propietario_id
      t.integer :garante_id

      t.timestamps null: false
    end
  end
end
