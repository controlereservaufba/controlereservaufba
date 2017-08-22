class Militar < ApplicationRecord
    has_many:cautela
    has_many:usermilitar
    
    validates_presence_of :nome, message: ' Não Pode ser Deixado em Branco'
    validates_presence_of :posto, message: ' Não Pode ser Deixado em Branco'
end
