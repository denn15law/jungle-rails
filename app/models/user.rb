class User < ActiveRecord::Base
  has_secure_password

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true
  validates :password, length: {minimum: 5}
  validates :password_confirmation, presence: true
  
  before_save :case_email

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.downcase.strip)
    @user && @user.authenticate(password) ? @user : nil
  end

  private
    def case_email  
      self.email.downcase!
      self.email.strip
    end
end
