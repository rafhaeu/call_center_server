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

ActiveRecord::Schema.define(version: 20160516104317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "call_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calls", force: :cascade do |t|
    t.string   "phone"
    t.datetime "called_at"
    t.integer  "duration"
    t.integer  "internal_id"
    t.integer  "call_type_id"
    t.integer  "rings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
  end

  create_table "client_phones", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "internals", force: :cascade do |t|
    t.string   "name"
    t.integer  "sector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sectors", ["name"], name: "index_sectors_on_name", using: :btree

  add_foreign_key "calls", "call_types"
  add_foreign_key "calls", "clients"
  add_foreign_key "calls", "internals"
  add_foreign_key "client_phones", "clients"
  add_foreign_key "internals", "sectors"
end
