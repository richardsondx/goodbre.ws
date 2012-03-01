class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string     :name
      t.text       :description
      t.timestamps
    end

    add_index :styles, :name
  end
end