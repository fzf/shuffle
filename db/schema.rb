# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140905041445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_players", force: true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_players", ["game_id"], name: "index_game_players_on_game_id", using: :btree
  add_index "game_players", ["player_id"], name: "index_game_players_on_player_id", using: :btree

  create_table "game_sides", force: true do |t|
    t.integer  "game_id"
    t.integer  "side_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_sides", ["game_id"], name: "index_game_sides_on_game_id", using: :btree
  add_index "game_sides", ["side_id"], name: "index_game_sides_on_side_id", using: :btree

  create_table "game_teams", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_teams", ["game_id"], name: "index_game_teams_on_game_id", using: :btree
  add_index "game_teams", ["team_id"], name: "index_game_teams_on_team_id", using: :btree

  create_table "games", force: true do |t|
    t.integer  "points"
    t.boolean  "completed",  default: false
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_sides", force: true do |t|
    t.integer  "player_id"
    t.integer  "side_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_sides", ["player_id"], name: "index_player_sides_on_player_id", using: :btree
  add_index "player_sides", ["side_id"], name: "index_player_sides_on_side_id", using: :btree

  create_table "player_teams", force: true do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_teams", ["player_id"], name: "index_player_teams_on_player_id", using: :btree
  add_index "player_teams", ["team_id"], name: "index_player_teams_on_team_id", using: :btree

  create_table "players", force: true do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree

  create_table "sides", force: true do |t|
    t.string   "direction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turns", force: true do |t|
    t.integer  "points"
    t.integer  "game_id"
    t.integer  "side_id"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
