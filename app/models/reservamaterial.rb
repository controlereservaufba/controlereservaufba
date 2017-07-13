class Reservamaterial < ApplicationRecord
    belong_to:reserva
    belong_to:acessorio
    belong_to:municao
end
