class CreatePdfs < ActiveRecord::Migration
  def change
    create_table :pdfs do |t|
      t.string :nombreArchivo
      t.text :contenido

      t.timestamps
    end
  end
end
