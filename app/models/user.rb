class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many:usermilitar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :email, length: {minimum: 10, message: 'Deve ter Pelo Menos 10 Caracteres'}
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  } # etc.
  
  validate :validate_username

  def validate_username
   if User.where(email: username).exists?
    errors.add(:username, :invalid)
   end
  end
                               
end
