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

ActiveRecord::Schema.define(version: 2019_02_03_113315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "borrows", force: :cascade do |t|
    t.bigint "stone_id"
    t.bigint "owner_id"
    t.bigint "borrower_id"
    t.string "signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["borrower_id"], name: "index_borrows_on_borrower_id"
    t.index ["owner_id"], name: "index_borrows_on_owner_id"
    t.index ["stone_id"], name: "index_borrows_on_stone_id"
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_connections_on_contact_id"
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "stone_id"
    t.boolean "is_accepted"
    t.bigint "owner_id"
    t.bigint "borrower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["borrower_id"], name: "index_requests_on_borrower_id"
    t.index ["owner_id"], name: "index_requests_on_owner_id"
    t.index ["stone_id"], name: "index_requests_on_stone_id"
  end

  create_table "returns", force: :cascade do |t|
    t.bigint "stone_id"
    t.bigint "owner_id"
    t.bigint "borrower_id"
    t.boolean "is_returned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["borrower_id"], name: "index_returns_on_borrower_id"
    t.index ["owner_id"], name: "index_returns_on_owner_id"
    t.index ["stone_id"], name: "index_returns_on_stone_id"
  end

  create_table "stones", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "color"
    t.string "carat"
    t.boolean "is_borrowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "clarity"
    t.string "cut"
    t.string "certification_number"
    t.index ["owner_id"], name: "index_stones_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "company_name"
    t.string "last_name"
    t.integer "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "borrows", "stones"
  add_foreign_key "borrows", "users", column: "borrower_id"
  add_foreign_key "borrows", "users", column: "owner_id"
  add_foreign_key "connections", "users"
  add_foreign_key "connections", "users", column: "contact_id"
  add_foreign_key "requests", "stones"
  add_foreign_key "requests", "users", column: "borrower_id"
  add_foreign_key "requests", "users", column: "owner_id"
  add_foreign_key "returns", "stones"
  add_foreign_key "returns", "users", column: "borrower_id"
  add_foreign_key "returns", "users", column: "owner_id"
  add_foreign_key "stones", "users", column: "owner_id"
end
