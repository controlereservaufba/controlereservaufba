class Cautela < ApplicationRecord
  belongs_to:reserva
  belongs_to:militar
  has_many:cautelaacessorio
  has_many:cautelamunicao
  has_many:cautelaarmamento
  
  validates_presence_of :reserva_id, message: 'Informe a Reserva!' 
  validates_presence_of :militar_id, message: 'Informe um Militar!'  

end
