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

ActiveRecord::Schema.define(version: 20161016203303) do

  create_table "legs", force: :cascade do |t|
    t.text     "description"
    t.decimal  "distance"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "track_file_name"
    t.string   "track_content_type"
    t.integer  "track_file_size"
    t.datetime "track_updated_at"
    t.integer  "trip_id"
    t.date     "date"
    t.string   "title"
    t.decimal  "hm"
    t.time     "time"
    t.decimal  "maxkmh"
  end

  add_index "legs", ["trip_id"], name: "index_legs_on_trip_id"

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.integer  "leg_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.decimal  "lat"
    t.decimal  "lon"
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "trackfile_file_name"
    t.string   "trackfile_content_type"
    t.integer  "trackfile_file_size"
    t.datetime "trackfile_updated_at"
    t.integer  "leg_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "trips", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "role"
    t.string   "remember"
  end

  create_table "usertrips", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "trip_id"
  end

  add_index "usertrips", ["trip_id"], name: "index_usertrips_on_trip_id"
  add_index "usertrips", ["user_id"], name: "index_usertrips_on_user_id"

end
