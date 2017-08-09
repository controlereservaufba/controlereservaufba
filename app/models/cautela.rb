class Cautela < ApplicationRecord
  belongs_to:reserva
  belongs_to:militar
  has_many:cautelaacessorio
    
end
