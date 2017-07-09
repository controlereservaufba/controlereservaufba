json.extract! user, :id, :username,:nome, :admin,:admin_reserva, :email,:password, :created_at, :updated_at
json.url o_url(user, format: :json)