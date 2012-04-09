module Api::User
  extend ActiveSupport::Concern

  included do
    api_accessible :public do |template|
      template.add :username
      template.add :email
    end
  end
end
