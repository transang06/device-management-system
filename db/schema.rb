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

ActiveRecord::Schema[7.0].define(version: 2023_04_10_101443) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brands_id"
    t.datetime "deleted_at"
    t.index ["brands_id"], name: "index_accessories_on_brands_id"
    t.index ["deleted_at"], name: "index_accessories_on_deleted_at"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_brands_on_deleted_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_categories_on_deleted_at"
  end

  create_table "companies", force: :cascade do |t|
    t.text "website", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_companies_on_deleted_at"
  end

  create_table "device_accessories", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "devices_id"
    t.bigint "accessories_id"
    t.datetime "deleted_at"
    t.index ["accessories_id"], name: "index_device_accessories_on_accessories_id"
    t.index ["deleted_at"], name: "index_device_accessories_on_deleted_at"
    t.index ["devices_id"], name: "index_device_accessories_on_devices_id"
  end

  create_table "device_histories", force: :cascade do |t|
    t.datetime "input_date"
    t.datetime "output_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "devices_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_device_histories_on_deleted_at"
    t.index ["devices_id"], name: "index_device_histories_on_devices_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.text "description"
    t.float "price", default: 0.0, null: false
    t.text "source", null: false
    t.integer "status", default: 0, null: false
    t.text "images"
    t.string "brand", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "offices_id"
    t.bigint "categories_id"
    t.datetime "deleted_at"
    t.index ["categories_id"], name: "index_devices_on_categories_id"
    t.index ["deleted_at"], name: "index_devices_on_deleted_at"
    t.index ["offices_id"], name: "index_devices_on_offices_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "groups_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_group_users_on_deleted_at"
    t.index ["groups_id"], name: "index_group_users_on_groups_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "project_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_groups_on_deleted_at"
    t.index ["users_id"], name: "index_groups_on_users_id"
  end

  create_table "office_infos", force: :cascade do |t|
    t.string "name", null: false
    t.text "information", null: false
    t.text "address", null: false
    t.text "email", null: false
    t.bigint "info_id", null: false
    t.string "info_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_office_infos_on_deleted_at"
  end

  create_table "offices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "companies_id"
    t.datetime "deleted_at"
    t.index ["companies_id"], name: "index_offices_on_companies_id"
    t.index ["deleted_at"], name: "index_offices_on_deleted_at"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "type", default: 0, null: false
    t.integer "status"
    t.text "reason"
    t.text "information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.bigint "devices_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_requests_on_deleted_at"
    t.index ["devices_id"], name: "index_requests_on_devices_id"
    t.index ["users_id"], name: "index_requests_on_users_id"
  end

  create_table "user_confirm_devices", force: :cascade do |t|
    t.integer "admin_device_status"
    t.integer "staff_device_status"
    t.datetime "admin_confirm_at"
    t.datetime "staff_comfirm_at"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_devices_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_user_confirm_devices_on_deleted_at"
    t.index ["user_devices_id"], name: "index_user_confirm_devices_on_user_devices_id"
  end

  create_table "user_devices", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.datetime "input_date"
    t.datetime "output_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_user_devices_on_deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "uid"
    t.string "provider"
    t.string "avatar"
    t.string "first_name"
    t.string "last_name"
    t.integer "status", default: 0, null: false
    t.integer "role", default: 0, null: false
    t.bigint "office_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "accessories", "brands", column: "brands_id"
  add_foreign_key "device_accessories", "accessories", column: "accessories_id"
  add_foreign_key "device_accessories", "devices", column: "devices_id"
  add_foreign_key "device_histories", "devices", column: "devices_id"
  add_foreign_key "devices", "categories", column: "categories_id"
  add_foreign_key "devices", "offices", column: "offices_id"
  add_foreign_key "group_users", "groups", column: "groups_id"
  add_foreign_key "groups", "users", column: "users_id"
  add_foreign_key "offices", "companies", column: "companies_id"
  add_foreign_key "requests", "devices", column: "devices_id"
  add_foreign_key "requests", "users", column: "users_id"
  add_foreign_key "user_confirm_devices", "user_devices", column: "user_devices_id"
end
