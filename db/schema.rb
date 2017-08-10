# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170810181708) do

  create_table "acessorios", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "armamentos", force: :cascade do |t|
    t.string "serie"
    t.string "modelo"
    t.string "fabricante"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cautelaacessorios", force: :cascade do |t|
    t.integer "cautela_id"
    t.integer "reservaacessorio_id"
    t.integer "qtd_acessorio"
    t.integer "qtd_acessorio_baixa"
    t.datetime "data_baixa"
    t.boolean "baixa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cautelamunicaos", force: :cascade do |t|
    t.integer "cautela_id"
    t.integer "reservamunicao_id"
    t.integer "qtd_municao"
    t.integer "qtd_municao_baixado"
    t.datetime "data_baixa"
    t.boolean "baixa", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cautelas", force: :cascade do |t|
    t.integer "militar_id"
    t.integer "reserva_id"
    t.datetime "data_cautela"
    t.datetime "data_fim_cautela"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "controles", force: :cascade do |t|
    t.integer "reserva_id"
    t.datetime "data_fechamento"
    t.datetime "data_abertura"
    t.boolean "status", default: true
    t.integer "qtd_municao"
    t.integer "qtd_armamento"
    t.integer "qtd_acessorio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "militars", force: :cascade do |t|
    t.string "nome"
    t.string "nome_guerra"
    t.string "posto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "municaos", force: :cascade do |t|
    t.string "calibre"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservaacessorios", force: :cascade do |t|
    t.integer "acessorio_id"
    t.integer "qtd_acessorio"
    t.string "serie"
    t.integer "reserva_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservaarmamentos", force: :cascade do |t|
    t.integer "armamento_id"
    t.integer "reserva_id"
    t.integer "qtd_armamento"
    t.string "serie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservamunicaos", force: :cascade do |t|
    t.integer "municao_id"
    t.integer "qtd_municao"
    t.string "serie"
    t.integer "reserva_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservas", force: :cascade do |t|
    t.string "sigla"
    t.string "descricao"
    t.integer "user_id"
    t.boolean "status", default: true
    t.datetime "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nome", default: "", null: false
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.boolean "admin_reserva"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
