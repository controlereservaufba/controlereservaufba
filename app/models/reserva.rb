class Reserva < ApplicationRecord
    has_many:reservaacessorios
    has_many:reservamunicaos
    has_many:reservaarmamento
    has_many:controles
    has_many:cautela
end
