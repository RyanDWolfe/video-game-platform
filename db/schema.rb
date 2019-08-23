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

ActiveRecord::Schema.define(version: 2019_08_23_190410) do

  create_table "developers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_sessions", force: :cascade do |t|
    t.integer "player_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "win"
    t.integer "loss"
    t.integer "score"
    t.integer "health"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "genre"
    t.integer "win_parameter"
    t.integer "lose_parameter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "developer_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "wins"
    t.integer "loses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.integer "uid"
    t.string "google_token"
    t.string "google_refresh_token"
  end

end
