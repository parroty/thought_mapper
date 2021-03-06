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

ActiveRecord::Schema.define(version: 20150519144434) do

  create_table "candidates", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "topic_id"
    t.integer  "position"
  end

  add_index "candidates", ["topic_id"], name: "index_candidates_on_topic_id"

  create_table "factors", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "score"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "view_point_id"
    t.integer  "candidate_id"
    t.integer  "topic_id"
  end

  add_index "factors", ["candidate_id"], name: "index_factors_on_candidate_id"
  add_index "factors", ["topic_id"], name: "index_factors_on_topic_id"
  add_index "factors", ["view_point_id"], name: "index_factors_on_view_point_id"

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "view_points_count", default: 0, null: false
    t.integer  "candidates_count",  default: 0, null: false
    t.integer  "factors_count",     default: 0, null: false
    t.text     "comment"
  end

  create_table "view_points", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "topic_id"
    t.integer  "position"
  end

  add_index "view_points", ["topic_id"], name: "index_view_points_on_topic_id"

end
