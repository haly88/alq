class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.text :descripcion
      t.belongs_to :comentable, polymorphic: true

      t.timestamps null: false
    end
    add_index :comentarios, [:comentable_id, :comentable_type] 
  end
end
