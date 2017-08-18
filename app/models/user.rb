class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many:usermilitar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :email, length: {minimum: 10, message: 'Deve ter Pelo Menos 10 Caracteres'}
                               
end
