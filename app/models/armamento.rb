class Armamento < ApplicationRecord
    has_many:reservaarmamento
    
    validates_presence_of :modelo, message: ' Não Pode ser Deixado em Branco!'
    validates_presence_of :fabricante, message: ' Não Pode ser Deixado em Branco!'
end
