class Acessorio < ApplicationRecord
 has_many:reservaacessorio

 validates_presence_of :descricao, message: 'Descrição Não Pode ser Deixado em Branco!'
    
end
