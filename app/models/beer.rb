class Beer < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :brewery
  belongs_to :style

  acts_as_api
  include Api::Beer
end
