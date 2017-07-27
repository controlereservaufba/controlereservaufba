class Reserva < ApplicationRecord
    has_many:reservaacessorios
    has_many:reservamunicaos
    has_many:reservaarmamentos
end
