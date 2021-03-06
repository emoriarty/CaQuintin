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

ActiveRecord::Schema.define(:version => 20110529143324) do

  create_table "bookings", :force => true do |t|
    t.integer  "people_number"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.time     "time"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "surname1"
    t.string   "surname2"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile"
    t.string   "nick"
    t.string   "password"
    t.string   "salt"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
  end

  add_index "people", ["email"], :name => "index_people_on_email", :unique => true

end
