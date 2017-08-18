class Usermilitar < ApplicationRecord
  belongs_to:militar
  belongs_to:user
  
  validates :militar_id,  uniqueness: {message: 'Deve ser Único'}
  validates :user_id,  uniqueness: {message: 'Deve ser Único'}

end
