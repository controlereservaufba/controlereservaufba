class Armamento < ApplicationRecord
    has_many:reservaarmamento
    
    validates_presence_of :modelo, message: 'Modelo Não Pode ser Deixado em Branco!'
    validates_presence_of :fabricante, message: 'Fabricante Não Pode ser Deixado em Branco!'
end
