# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(nome: 'Admin',username:'admin', email:'admin@admin.com.br', password:'admin1', admin:true)
Miliar.create(nome: 'ADMIN TOTAL',nom_guerra:'TOTAL', posto:'CAPITAO')
Acessorio.create(descricao: 'BANDANA')
Acessorio.create(descricao: 'SILENCIADOR')
Acessorio.create(descricao: 'BINOCULOS')
Acessorio.create(descricao: 'BUSSOLA')
Acessorio.create(descricao: 'CORDA')
Municao.create(calibre:'9 mm',descricao:'38 auto.')
Municao.create(calibre:'15 mm',descricao:'45 auto.')
Armamento.create(modelo:'PISTOLA',fabricante:'AJAX')
Armamento.create(modelo:'REVOLVER',fabricante:'AJAX')
Armamento.create(modelo:'METRALHADORA',fabricante:'AJAX')
Armamento.create(modelo:'12',fabricante:'AJAX')
Armamento.create(modelo:'ESPINGRADA',fabricante:'AJAX')
Armamento.create(modelo:'ESCOPETA',fabricante:'AJAX')
Reserva.create(sigla:'REIM',descricao:'RESERVA QG IM',data: Time.current.now)
Reserva.create(sigla:'REIBIO',descricao:'RESERVA QG IBIO',data: Time.current.now)
Reservaacessorio.create(reserva_id:1,qtd_acessorio:30, acessorio_id:1)
Reservaacessorio.create(reserva_id:1,qtd_acessorio:45, acessorio_id:2)
Reservaacessorio.create(reserva_id:1,qtd_acessorio:65, acessorio_id:3)
Reservaacessorio.create(reserva_id:2,qtd_acessorio:80, acessorio_id:4)
Reservaacessorio.create(reserva_id:2,qtd_acessorio:10, acessorio_id:5)
Reservaacessorio.create(reserva_id:2,qtd_acessorio:90, acessorio_id:2)
Reservamunicao.create(reserva_id:1,qtd_municao:400, municao_id:1)
Reservamunicao.create(reserva_id:2,qtd_municao:560, municao_id:2)
Reservaarmamento.create(reserva_id:1,qtd_armamento:1, armamento_id:1,serie:'I001')
Reservaarmamento.create(reserva_id:1,qtd_armamento:1, armamento_id:2,serie:'I002')
Reservaarmamento.create(reserva_id:1,qtd_armamento:1, armamento_id:3,serie:'I003')
Reservaarmamento.create(reserva_id:2,qtd_armamento:1, armamento_id:4,serie:'I004')
Reservaarmamento.create(reserva_id:2,qtd_armamento:1, armamento_id:5,serie:'I005')
Reservaarmamento.create(reserva_id:2,qtd_armamento:1, armamento_id:6,serie:'I006')




