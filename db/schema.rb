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

ActiveRecord::Schema.define(version: 2019_09_30_115343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: :cascade do |t|
    t.bigint "your_fighter_id"
    t.bigint "enemy_fighter_id"
    t.bigint "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "remaining_health"
    t.integer "duration"
    t.index ["enemy_fighter_id"], name: "index_battles_on_enemy_fighter_id"
    t.index ["winner_id"], name: "index_battles_on_winner_id"
    t.index ["your_fighter_id"], name: "index_battles_on_your_fighter_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "mode"
    t.string "name"
    t.integer "value"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.integer "attack"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "left_hand_id"
    t.integer "right_hand_id"
    t.integer "victories", default: 0
    t.float "exp", default: 0.0
    t.string "photo"
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

  add_foreign_key "battles", "fighters", column: "enemy_fighter_id"
  add_foreign_key "battles", "fighters", column: "winner_id"
  add_foreign_key "battles", "fighters", column: "your_fighter_id"
  add_foreign_key "fighters", "equipment", column: "left_hand_id"
  add_foreign_key "fighters", "equipment", column: "right_hand_id"
end
