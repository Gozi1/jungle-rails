class User < ApplicationRecord
  has_secure_password
  
  validates :first_name, :last_name, :email, :password, presence: true
  validates :password, confirmation: true
  validates :email, uniqueness:{ case_sensitive: false }
  validates :password, length: { in: 6..20 }

  def self.authenticate_with_credentials(email,password)

    user = User.find_by_email(email.delete(' ').downcase)
    if user && user.authenticate(password)
      return user
    else 
      return nil
    end
  end     
end
