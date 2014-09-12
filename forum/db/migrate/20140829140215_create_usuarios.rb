class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :username, limit: 40
      t.string :email, limit: 100
      t.string :senha, limit: 30
      t.references :tipouser, index: true

      t.timestamps
    end
  end
end
