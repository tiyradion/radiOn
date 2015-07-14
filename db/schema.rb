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

ActiveRecord::Schema.define(version: 20150713231637) do

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "album_name"
    t.string   "song_name"
    t.integer  "promoter_id"
    t.string   "uploaded_file_file_name"
    t.string   "uploaded_file_content_type"
    t.integer  "uploaded_file_file_size"
    t.datetime "uploaded_file_updated_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "description"
    t.integer  "artist_id"
    t.integer  "station_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "comment"
    t.boolean  "request"
    t.integer  "artist_id"
    t.integer  "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promoters", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "company_name"
    t.string   "picture_upload_file_name"
    t.string   "picture_upload_content_type"
    t.integer  "picture_upload_file_size"
    t.datetime "picture_upload_updated_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "phone_number"
  end

  create_table "promoters_stations", id: false, force: :cascade do |t|
    t.integer "station_id",  null: false
    t.integer "promoter_id", null: false
  end

  add_index "promoters_stations", ["promoter_id", "station_id"], name: "index_promoters_stations_on_promoter_id_and_station_id"
  add_index "promoters_stations", ["station_id", "promoter_id"], name: "index_promoters_stations_on_station_id_and_promoter_id"

  create_table "requests", force: :cascade do |t|
    t.boolean  "requested"
    t.integer  "artist_id"
    t.integer  "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "picture_upload_file_name"
    t.string   "picture_upload_content_type"
    t.integer  "picture_upload_file_size"
    t.datetime "picture_upload_updated_at"
    t.string   "station_name"
    t.string   "phone_number"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
