class User < ActiveRecord::Base
  include Gravtastic

  has_secure_password
  validates_length_of :password, :minimum => 6, :on => :create

  validates_exclusion_of :username, :in => %w( admin superuser root goodbrews guest )
  validates_format_of :username, :with => /^\w+$/
  validates_uniqueness_of :username, :case_sensitive => false, :message => "has been taken."
  validates_length_of :username, :within => 4..20
  validates_presence_of :username

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email, :case_sensitive => false, :message => "is in use."
  validates_presence_of :email

  before_create { generate_token(:auth_token) }

  recommends :beers

  gravtastic :filetype => :png,
             :size => 150,
             :default => "http://goodbre.ws/images/user.png"

  def to_param
    username.parameterize
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token :password_reset_token
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def self.from_param(param)
    where(:username => param).first
  end

  def self.find_by_login(login)
    where("username = '#{login}' OR email = '#{login}'").first
  end
end
