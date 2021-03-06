class User < ActiveRecord::Base

  before_save {self.email = email.downcase}
  validates :username, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 4, maximum: 20}
  Valid_Email_Regex =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presense: true,
            uniqueness: {case_sensitive: false},
            length: {maximum: 105},
            format: {with: Valid_Email_Regex}
  has_secure_password
end
