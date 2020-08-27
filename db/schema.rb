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

ActiveRecord::Schema.define(version: 2020_08_27_222241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "contents", force: :cascade do |t|
    t.string "name"
    t.string "header"
    t.string "menu"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "menu_publish", default: false, null: false
  end

  create_table "ltc_billings", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "amount"
    t.string "description"
    t.string "product_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ltc_billings_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "safedelete"
    t.decimal "ltc", default: "0.0"
    t.date "baner_top_date_start"
    t.date "baner_top_date_end"
    t.string "baner_top_img"
    t.string "baner_top_url"
    t.string "baner_top_status", default: "undefined"
    t.date "baner_menu_date_start"
    t.date "baner_menu_date_end"
    t.string "baner_menu_img"
    t.string "baner_menu_url"
    t.string "baner_menu_status", default: "undefined"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "servers", force: :cascade do |t|
    t.decimal "rating", precision: 3, scale: 2, default: "1.0"
    t.string "publish", default: "create", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title", limit: 42
    t.string "urlserver"
    t.datetime "datestart"
    t.bigint "user_id"
    t.integer "rate", default: 1, null: false
    t.bigint "serverversion_id", default: 1, null: false
    t.integer "status", default: 3, null: false
    t.string "imageserver"
    t.text "description"
    t.date "status_expires", default: "2020-01-01", null: false
    t.text "failed"
    t.index ["serverversion_id"], name: "index_servers_on_serverversion_id"
    t.index ["title"], name: "index_servers_on_title", unique: true
    t.index ["user_id"], name: "index_servers_on_user_id"
  end

  create_table "serverversions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "baned", default: false, null: false
    t.string "provider", limit: 50, default: "email", null: false
    t.string "uid", limit: 200, default: "", null: false
    t.string "username", limit: 50, default: "", null: false
    t.datetime "votetime", default: "2020-01-01 00:00:00", null: false
    t.string "country"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "server_id"
    t.bigint "user_id"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "country", default: "ru"
    t.index ["server_id"], name: "index_votes_on_server_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

end
