class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,                    :null => false
      t.string :username,                 :null => false
      t.string :password_digest,          :null => false
      t.string :city
      t.string :region
      t.float :lat
      t.float :lon

      t.timestamps
    end

    add_index :users, :username, :unique => true
    add_index :users, :email, :unique => true
  end
end
