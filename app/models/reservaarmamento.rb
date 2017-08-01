class Reservaarmamento < ApplicationRecord
 belongs_to:reserva
 belongs_to:armamento
 
     
 def self.total
   self.sum(:qtd_armamento)
 end
end
