class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.references :brewery
      t.string     :name
      t.float      :abv
      t.references :style
      t.text       :description
      t.boolean    :discontinued
      t.timestamps
    end

    add_index :beers, :name
  end
end
