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

ActiveRecord::Schema[8.0].define(version: 2025_03_27_184956) do
  create_table "additives", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beverage_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beverages", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "subcategory"
    t.decimal "calories_per_100ml"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "beverage_category_id", null: false
    t.index ["beverage_category_id"], name: "index_beverages_on_beverage_category_id"
  end

  create_table "quantities", force: :cascade do |t|
    t.decimal "quantity"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temperatures", force: :cascade do |t|
    t.decimal "degrees", precision: 5, scale: 2
    t.string "scale"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackers", force: :cascade do |t|
    t.datetime "consumed_at"
    t.boolean "symptom_occurence"
    t.string "symptom_severity"
    t.string "symptom_timing"
    t.integer "beverage_id", null: false
    t.integer "symptom_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beverage_id"], name: "index_trackers_on_beverage_id"
    t.index ["symptom_id"], name: "index_trackers_on_symptom_id"
    t.index ["user_id"], name: "index_trackers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "beverages", "beverage_categories"
  add_foreign_key "trackers", "beverages"
  add_foreign_key "trackers", "symptoms"
  add_foreign_key "trackers", "users"
end
