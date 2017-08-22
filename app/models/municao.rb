class Municao < ApplicationRecord
    has_many:reservamunicao
    validates_presence_of :calibre, message: ' Não Pode ser Deixado em Branco!'
end
