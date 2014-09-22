class CreateConteudos < ActiveRecord::Migration
  def change
    create_table :conteudos do |t|
      t.integer :bimestre
      t.string :nome, limit: 30
      t.string :arquivo, limit: 36

      t.timestamps
    end
  end
end
