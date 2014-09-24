class CreateTipos < ActiveRecord::Migration
  def change
    create_table :tipos do |t|
      t.string :nome, limit: 30

      t.timestamps
    end
  end
end
