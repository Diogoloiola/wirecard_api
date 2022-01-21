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

ActiveRecord::Schema.define(version: 2022_01_21_175418) do

  create_table "cards", force: :cascade do |t|
    t.string "holder_name"
    t.string "number"
    t.string "expiration"
    t.string "cvv"
    t.integer "issuing_bank_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.datetime "invoice_due_date"
    t.decimal "balance"
    t.decimal "fixed_balance"
    t.index ["issuing_bank_id"], name: "index_cards_on_issuing_bank_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "issuing_banks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "months", force: :cascade do |t|
    t.integer "month_code"
    t.integer "year_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["year_id"], name: "index_months_on_year_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.integer "billing_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.datetime "due_date"
    t.integer "month_id", null: false
    t.string "code"
    t.index ["month_id"], name: "index_payments_on_month_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "years", force: :cascade do |t|
    t.string "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cards", "issuing_banks"
  add_foreign_key "cards", "users"
  add_foreign_key "months", "years"
  add_foreign_key "payments", "months"
  add_foreign_key "payments", "users"
end
