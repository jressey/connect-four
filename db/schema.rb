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

ActiveRecord::Schema.define(version: 20170416183447) do

  create_table "boards", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_boards_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string   "player_1_id"
    t.string   "state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "player_2_id"
    t.integer  "gametype"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "wins",       default: 0
    t.integer  "losses",     default: 0
    t.integer  "draws",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "points", force: :cascade do |t|
    t.integer  "board_id"
    t.integer  "player_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "x_coord"
    t.integer  "y_coord"
    t.integer  "state",      default: 1
    t.index ["board_id"], name: "index_points_on_board_id"
    t.index ["player_id"], name: "index_points_on_player_id"
  end

end
