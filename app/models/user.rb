class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_secure_password

  validates_exclusion_of :username, :in => %w( admin superuser root goodbrews guest )
  validates_format_of :username, :with => /^\w+$/
  validates_uniqueness_of :username, :case_sensitive => false, :message => "has been taken."
  validates_length_of :username, :within => 4..20
  validates_presence_of :username

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email, :case_sensitive => false, :message => "is in use."
  validates_presence_of :email

  validates_presence_of :password, :on => :create
  validates_length_of :password, :minimum => 6
  validates_presence_of :password_confirmation

  recommends :beers
end
