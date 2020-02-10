# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_09_204742) do

  create_table "periodicities", force: :cascade do |t|
    t.string "name"
    t.integer "period"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "product_type_id", null: false
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.index ["product_type_id"], name: "index_plans_on_product_type_id"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal "plan_price"
    t.integer "plan_id", null: false
    t.integer "periodicity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["periodicity_id"], name: "index_prices_on_periodicity_id"
    t.index ["plan_id"], name: "index_prices_on_plan_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "product_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "plans", "product_types"
  add_foreign_key "prices", "periodicities"
  add_foreign_key "prices", "plans"
end
