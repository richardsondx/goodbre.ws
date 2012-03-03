class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string     :name
      t.text       :description
      t.boolean    :closed
      t.string     :permalink
      t.timestamps
    end

    add_index :breweries, :name
  end
end
