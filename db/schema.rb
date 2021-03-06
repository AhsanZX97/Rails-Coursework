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

ActiveRecord::Schema.define(version: 20171204145603) do

  create_table "fixtures", force: :cascade do |t|
    t.integer  "league_id",              null: false
    t.integer  "home_id",                null: false
    t.integer  "away_id",                null: false
    t.integer  "homegoals",  default: 0, null: false
    t.integer  "awaygoals",  default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["away_id"], name: "index_fixtures_on_away_id"
    t.index ["home_id"], name: "index_fixtures_on_home_id"
    t.index ["league_id"], name: "index_fixtures_on_league_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "title",                  null: false
    t.integer  "nums",       default: 5, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",                null: false
    t.index ["user_id"], name: "index_leagues_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "league_id"
    t.string   "name",                   null: false
    t.string   "coach",                  null: false
    t.integer  "MP",         default: 0
    t.integer  "W",          default: 0
    t.integer  "D",          default: 0
    t.integer  "L",          default: 0
    t.integer  "Pts",        default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["league_id"], name: "index_teams_on_league_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
