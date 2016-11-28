class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.integer :id_marca
      t.text :descripcion
      t.integer :precio_pesos
      t.integer :precio_dolares

      t.timestamps null: false
    end
  end
end
