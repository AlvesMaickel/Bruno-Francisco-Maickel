class CreateLista < ActiveRecord::Migration
  def change
    create_table :lista do |t|
      t.references :conteudo, index: true
      t.string :arquivo, limit: 36
      t.string :nome, limit: 30

      t.timestamps
    end
  end
end
