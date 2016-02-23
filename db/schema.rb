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

ActiveRecord::Schema.define(version: 20160221103942) do

  create_table "comment_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "comment_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "comment_anc_desc_udx", unique: true
  add_index "comment_hierarchies", ["descendant_id"], name: "comment_desc_idx"

  create_table "comments", force: :cascade do |t|
    t.integer  "directive_id"
    t.text     "content"
    t.integer  "parent_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comments", ["directive_id"], name: "index_comments_on_directive_id"

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["recipient_id"], name: "index_conversations_on_recipient_id"
  add_index "conversations", ["sender_id"], name: "index_conversations_on_sender_id"

  create_table "directives", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  create_table "directives_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "directive_id"
    t.string  "type"
  end

  add_index "directives_users", ["user_id", "directive_id"], name: "index_directives_users_on_user_id_and_directive_id", unique: true

  create_table "manages", force: :cascade do |t|
    t.integer "delegate_id"
    t.integer "crisis_id"
  end

  add_index "manages", ["delegate_id", "crisis_id"], name: "index_manages_on_delegate_id_and_crisis_id", unique: true

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
