class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.references :tipo, index: true
      t.string :username, limit: 20
      t.string :email, limit: 30
      t.string :senha, limit: 12

      t.timestamps
    end
  end
end
