ActiveRecord::Schema.define(version: 2020_01_28_194910) do

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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "plans", "product_types"
  add_foreign_key "prices", "periodicities"
  add_foreign_key "prices", "plans"
end
