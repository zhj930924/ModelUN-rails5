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

ActiveRecord::Schema.define(version: 20160214005025) do

  create_table "directives", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "real_name"
    t.string   "committee"
    t.string   "position"
    t.string   "email"
    t.integer  "graduation_class"
    t.string   "password"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.string   "type"
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users_directives", force: :cascade do |t|
    t.integer "user_id"
    t.integer "directive_id"
  end

  add_index "users_directives", ["directive_id"], name: "index_users_directives_on_directive_id"
  add_index "users_directives", ["user_id", "directive_id"], name: "index_users_directives_on_user_id_and_directive_id", unique: true
  add_index "users_directives", ["user_id"], name: "index_users_directives_on_user_id"

end