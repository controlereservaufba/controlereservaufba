json.extract! reservaarmamento, :id, :armamento_id, :reserva_id, :qtd_armamento, :serie, :created_at, :updated_at
json.url reservaarmamento_url(reservaarmamento, format: :json)
