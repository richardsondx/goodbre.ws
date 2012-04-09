module Api::Style
  extend ActiveSupport::Concern
  
  included do
    api_accessible :public do |template|
      template.add :name
      template.add :permalink
      template.add :description
    end
  end
end
