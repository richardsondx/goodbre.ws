class Style < ActiveRecord::Base
  validates_presence_of :name
  has_many :beers
  before_create :set_permalink

  acts_as_api
  include Api::Style

  def to_param
    self.permalink
  end

  def self.from_param(param)
    self.where(:permalink => param).first
  end

  private

  def set_permalink
    self.permalink = self.name.parameterize
  end
end
