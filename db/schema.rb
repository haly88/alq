# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150719195837) do

  create_table "contratos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.boolean  "activo",      null: false
    t.string   "descripcion"
    t.string   "carpeta"
    t.date     "fecha"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contratos_items", force: :cascade do |t|
    t.integer  "contrato_id"
    t.date     "fecha_desde"
    t.date     "fecha_hasta"
    t.decimal  "monto"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "contratos_items", ["contrato_id"], name: "index_contratos_items_on_contrato_id"

  create_table "personas", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.boolean  "activo"
    t.text     "descripcion"
    t.boolean  "es_inquilino"
    t.boolean  "es_propietario"
    t.boolean  "es_garante"
    t.boolean  "es_otro"
    t.string   "telefono"
    t.string   "email"
    t.string   "direccion"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
