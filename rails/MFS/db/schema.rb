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

ActiveRecord::Schema.define(:version => 20131220121954) do

  create_table "reviews", :force => true do |t|
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
    t.integer  "user_id"
    t.string   "image_uid"
  end

  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
    t.string   "name"
    t.text     "image"
    t.string   "profile_url"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "role",        :default => "user"
  end

  add_index "users", ["provider", "uid"], :name => "index_users_on_provider_and_uid", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "review_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "vote_type"
  end

  add_index "votes", ["review_id", "user_id"], :name => "index_votes_on_review_id_and_user_id", :unique => true
  add_index "votes", ["review_id"], :name => "index_votes_on_review_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"
  add_index "votes", ["vote_type"], :name => "index_votes_on_vote_type"

end
