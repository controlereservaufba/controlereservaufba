class Municao < ApplicationRecord
    has_many:reservamunicao
    validates_presence_of :calibre, message: 'Calibre Não Pode ser Deixado em Branco!'
end
