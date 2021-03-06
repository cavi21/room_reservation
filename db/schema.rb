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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130226165700) do

  create_table "reservations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "start_dt"
    t.datetime "end_dt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.boolean  "is_block",      :default => false
    t.string   "deleted_by"
    t.string   "cc"
    t.string   "config_option"
    t.boolean  "deleted",       :default => false
  end

  create_table "rooms", :force => true do |t|
    t.integer  "sort_order"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_of_room"
    t.string   "size_of_room"
    t.string   "image_link"
    t.text     "hours"
    t.integer  "sort_size_of_room", :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",          :default => "", :null => false
    t.string   "mobile_phone"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",                 :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "expiration_date"
    t.datetime "last_login_at"
    t.text     "user_attributes"
    t.datetime "refreshed_at"
  end

end
