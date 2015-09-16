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

ActiveRecord::Schema.define(version: 20150915000739) do

  create_table "contratos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.boolean  "activo",      default: true
    t.string   "descripcion"
    t.string   "carpeta"
    t.date     "fecha"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "inmueble_id"
  end

  add_index "contratos", ["inmueble_id"], name: "index_contratos_on_inmueble_id"

  create_table "contratos_impuestos", force: :cascade do |t|
    t.integer  "contrato_id"
    t.integer  "impuesto_id"
    t.decimal  "monto",             precision: 12, scale: 4
    t.date     "fecha_vencimiento"
    t.date     "fecha_pago"
    t.boolean  "pago"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "contratos_impuestos", ["contrato_id"], name: "index_contratos_impuestos_on_contrato_id"
  add_index "contratos_impuestos", ["impuesto_id"], name: "index_contratos_impuestos_on_impuesto_id"

  create_table "contratos_items", force: :cascade do |t|
    t.integer  "contrato_id"
    t.date     "fecha_desde"
    t.date     "fecha_hasta"
    t.decimal  "monto",       precision: 12, scale: 4
    t.decimal  "saldo",       precision: 12, scale: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "contratos_items", ["contrato_id"], name: "index_contratos_items_on_contrato_id"

  create_table "contratos_personas_tipos", force: :cascade do |t|
    t.integer  "contrato_id"
    t.integer  "inquilino_id"
    t.integer  "propietario_id"
    t.integer  "garante_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "contratos_personas_tipos", ["contrato_id"], name: "index_contratos_personas_tipos_on_contrato_id"

  create_table "empresas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "razon_social"
    t.string   "direccion"
    t.string   "piso"
    t.string   "depto"
    t.string   "telefono"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "impuestos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "cantidad_meses_defecto"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "inmueble_tipos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inmuebles", force: :cascade do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.boolean  "activo",           default: true
    t.integer  "inmueble_tipo_id"
    t.string   "direccion"
    t.string   "piso"
    t.string   "depto"
    t.string   "localidad"
    t.string   "codigo_postal"
    t.string   "administracion"
    t.string   "adm_email"
    t.string   "adm_tel1"
    t.string   "adm_tel2"
    t.string   "adm_tel3"
    t.string   "encargado"
    t.string   "enc_email"
    t.string   "enc_tel1"
    t.string   "enc_tel2"
    t.string   "enc_tel3"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "inmuebles", ["inmueble_tipo_id"], name: "index_inmuebles_on_inmueble_tipo_id"

  create_table "liquidaciones", force: :cascade do |t|
    t.integer  "contrato_id"
    t.date     "fecha"
    t.decimal  "neto",           precision: 12, scale: 4
    t.decimal  "descuento",      precision: 12, scale: 4
    t.decimal  "comision",       precision: 12, scale: 4
    t.decimal  "total",          precision: 12, scale: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "inquilino_id"
    t.integer  "propietario_id"
  end

  add_index "liquidaciones", ["contrato_id"], name: "index_liquidaciones_on_contrato_id"

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
