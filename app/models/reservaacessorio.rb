class Reservaacessorio < ApplicationRecord
    belongs_to:reserva
    belongs_to:acessorio
    
    def self.total
     self.sum(:qtd_acessorio)
    end
    
    
end
