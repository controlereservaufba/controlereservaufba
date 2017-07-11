json.extract! reserva, :id, :sigla, :descricao, :user_id, :status, :data, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
