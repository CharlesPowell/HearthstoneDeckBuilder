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

ActiveRecord::Schema.define(version: 20150528212711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.integer  "cost"
    t.string   "cardType"
    t.string   "rarity"
    t.string   "faction"
    t.string   "race"
    t.string   "playerclass"
    t.string   "text"
    t.string   "inPlayText"
    t.string   "mechanics",                array: true
    t.string   "flavor"
    t.string   "artist"
    t.integer  "attack"
    t.integer  "health"
    t.integer  "durability"
    t.string   "blizzid"
    t.boolean  "collectible"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cards_decks", force: :cascade do |t|
    t.integer "card_id"
    t.integer "deck_id"
  end

  add_index "cards_decks", ["card_id"], name: "index_cards_decks_on_card_id", using: :btree
  add_index "cards_decks", ["deck_id"], name: "index_cards_decks_on_deck_id", using: :btree

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.string   "class_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "decks", ["user_id"], name: "index_decks_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "cards_decks", "cards"
  add_foreign_key "cards_decks", "decks"
  add_foreign_key "decks", "users"
end
