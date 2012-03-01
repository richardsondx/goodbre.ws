class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_secure_password

  validates_exclusion_of :username, :in => %w( admin superuser root goodbrews )
  validates_format_of :username, :with => /^\w+$/
  validates_uniqueness_of :username, :case_sensitive => false, :message => "has been taken."
  validates_length_of :username, :within => 4..20

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates_presence_of :password, :on => :create, :if => :password_required?
  validates_length_of :password, :minimum => 6
  validates_presence_of :password_confirmation, :if => :password_changed?

  before_create { generate_token(:auth_token) }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
