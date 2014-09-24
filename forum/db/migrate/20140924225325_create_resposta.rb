class CreateResposta < ActiveRecord::Migration
  def change
    create_table :resposta do |t|
      t.references :pergunta, index: true
      t.references :usuario, index: true
      t.text :texto
      t.integer :util_s
      t.integer :util_n
      t.timestamp :horario
      t.string :arquivo, limit: 36

      t.timestamps
    end
  end
end
