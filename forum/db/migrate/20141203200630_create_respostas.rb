class CreateRespostas < ActiveRecord::Migration
  def change
    create_table :respostas do |t|
      t.references :pergunta, index: true
      t.references :usuario, index: true
      t.text :texto
      t.integer :util_s
      t.integer :util_n
      t.timestamp :horario
      t.string :arquivo, limit: 36
      t.string :username, limit: 50

      t.timestamps
    end
  end
end
