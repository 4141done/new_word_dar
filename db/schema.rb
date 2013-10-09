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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
ActiveRecord::Schema.define(version: 20131002052807) do

  create_table "crawl_queues", force: true do |t|
    t.json     "crawl_params"
    t.string   "crawler"
    t.datetime "last_crawl"
  end

  create_table "daily_counts", force: true do |t|
    t.integer  "count"
    t.date     "day"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "daily_counts", ["day"], name: "index_daily_counts_on_day", using: :btree
  add_index "daily_counts", ["word_id", "day"], name: "index_daily_counts_on_word_id_and_day", unique: true, using: :btree
  add_index "daily_counts", ["word_id"], name: "index_daily_counts_on_word_id", using: :btree

  create_table "words", force: true do |t|
    t.string   "word"
    t.string   "context"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "words", ["word"], name: "index_words_on_word", unique: true, using: :btree

end
