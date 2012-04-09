module Api::Brewery
  extend ActiveSupport::Concern

  included do
    api_accessible :public do |t|
      t.add :name
      t.add :permalink
      t.add :description
      t.add :closed
      t.add :address
      t.add :website
      t.add :phone
    end
  end
end
