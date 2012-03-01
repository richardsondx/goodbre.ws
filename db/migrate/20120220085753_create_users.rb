class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,                    :null => false
      t.string :username,                 :null => false
      t.string :password_digest,          :null => false
      t.string :auth_token
      t.string :facebook_token
      t.string :twitter_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
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
