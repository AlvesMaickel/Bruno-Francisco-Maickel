class CreateListas < ActiveRecord::Migration
  def change
    create_table :listas do |t|
      t.references :conteudo, index: true
      t.string :arquivo, limit: 36
      t.string :nome, limit: 30

      t.timestamps
    end
  end
end
