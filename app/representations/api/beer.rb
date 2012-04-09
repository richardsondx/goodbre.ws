module Api::Beer
  extend ActiveSupport::Concern

  included do
    api_accessible :public do |t|
      t.add :name
      t.add :abv
      t.add :discontinued
      t.add :brewery
      t.add :style
    end
  
    api_accessible :brewery, :extend => :public do |t|
      t.remove :brewery
    end
  
    api_accessible :style, :extend => :public do |t|
      t.remove :style
    end
  end
end
