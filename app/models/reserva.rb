class Reserva < ApplicationRecord
    has_many:reservaacessorios
    has_many:reservamunicaos
    has_many:reservaarmamento
    has_many:controles
    has_many:cautela
    
    validates_presence_of :sigla, message: ' Não Pode ser Deixado em Branco!'
    validates_presence_of :descricao, message: ' Não Pode ser Deixado em Branco!'
end
