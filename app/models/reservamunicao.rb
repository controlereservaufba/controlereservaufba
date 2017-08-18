class Reservamunicao < ApplicationRecord
 
 belongs_to:reserva
 belongs_to:municao
 has_many:cautelamunicao
 
 def self.total
   self.sum(:qtd_municao)
 end
end 
