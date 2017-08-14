class Reservaarmamento < ApplicationRecord
 belongs_to:reserva
 belongs_to:armamento
 has_many:cautelaarmamento
 
     
 def self.total
   self.sum(:qtd_armamento)
 end
end
