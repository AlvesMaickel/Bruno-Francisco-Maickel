class CreatePerguntas < ActiveRecord::Migration
  def change
    create_table :perguntas do |t|
      t.references :usuario, index: true
      t.references :conteudo, index: true
      t.references :lista, index: true
      t.text :texto
      t.timestamp :horario
      t.integer :n_respostas
      t.string :respondida, limit: 1
      t.string :arquivo, limit: 36

      t.timestamps
    end
  end
end
