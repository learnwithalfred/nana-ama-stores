# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_29_185323) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assemblies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "amount", null: false
    t.bigint "store_id", null: false
    t.string "payee", null: false
    t.boolean "payment_complete"
    t.decimal "balance"
    t.decimal "arrears"
    t.bigint "tax_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_payments_on_store_id"
    t.index ["tax_id"], name: "index_payments_on_tax_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_taxes", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "tax_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_taxes_on_store_id"
    t.index ["tax_id"], name: "index_store_taxes_on_tax_id"
  end

  create_table "stores", force: :cascade do |t|
    t.bigint "assembly_id", null: false
    t.bigint "user_id", null: false
    t.bigint "sub_district_id", null: false
    t.bigint "community_id", null: false
    t.bigint "sector_id", null: false
    t.string "serial_number", null: false
    t.string "digital_address", null: false
    t.string "purpose_of_structure", null: false
    t.string "mode_of_structure", null: false
    t.string "materials_used_for_walls", null: false
    t.text "address", null: false
    t.boolean "is_there_network_mast", null: false
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assembly_id"], name: "index_stores_on_assembly_id"
    t.index ["community_id"], name: "index_stores_on_community_id"
    t.index ["sector_id"], name: "index_stores_on_sector_id"
    t.index ["sub_district_id"], name: "index_stores_on_sub_district_id"
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "sub_districts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "description", null: false
    t.string "period", null: false
    t.decimal "amount", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_taxes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "gender", null: false
    t.string "address"
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "payments", "stores"
  add_foreign_key "payments", "taxes"
  add_foreign_key "payments", "users"
  add_foreign_key "store_taxes", "stores"
  add_foreign_key "store_taxes", "taxes"
  add_foreign_key "stores", "assemblies"
  add_foreign_key "stores", "communities"
  add_foreign_key "stores", "sectors"
  add_foreign_key "stores", "sub_districts"
  add_foreign_key "stores", "users"
  add_foreign_key "taxes", "users"
end
