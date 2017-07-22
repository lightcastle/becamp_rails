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

ActiveRecord::Schema.define(version: 20170722185159) do

  create_table "faqs", force: :cascade do |t|
    t.text     "question",   limit: 65535
    t.text     "answer",     limit: 65535
    t.integer  "sequence",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.text     "homepage_url", limit: 65535
    t.text     "logo_url",     limit: 65535
    t.integer  "width",        limit: 4
    t.integer  "sequence",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               limit: 255, default: "",    null: false
    t.integer  "sign_in_count",       limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",            limit: 255
    t.string   "uid",                 limit: 255
    t.string   "name",                limit: 255
    t.boolean  "admin",                           default: false, null: false
    t.boolean  "attending"
    t.string   "heard_about_by",      limit: 255
    t.boolean  "first_time_attendee"
    t.string   "shirt_size",          limit: 255
    t.datetime "registered_at"
    t.boolean  "list_me"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
