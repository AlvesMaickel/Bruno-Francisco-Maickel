class CreateTipousers < ActiveRecord::Migration
  def change
    create_table :tipousers do |t|
      t.string :nome, limit: 30

      t.timestamps
    end
  end
end
