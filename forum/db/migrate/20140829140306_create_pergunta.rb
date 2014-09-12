class CreatePergunta < ActiveRecord::Migration
  def change
    create_table :pergunta do |t|
      t.text :texto
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
