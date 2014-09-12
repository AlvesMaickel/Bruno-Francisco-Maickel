class CreateResposta < ActiveRecord::Migration
  def change
    create_table :resposta do |t|
      t.text :texto
      t.references :pergunta, index: true

      t.timestamps
    end
  end
end
