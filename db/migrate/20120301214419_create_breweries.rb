class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string     :name
      t.text       :description
      t.boolean    :closed
      t.string     :permalink
      t.string     :street1
      t.string     :street2
      t.string     :city
      t.string     :region
      t.string     :zip
      t.string     :country
      t.string     :website
      t.string     :phone
      
      t.timestamps
    end

    add_index :breweries, :name
  end
end
