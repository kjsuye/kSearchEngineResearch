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

ActiveRecord::Schema.define(version: 20151206021134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "codes", force: :cascade do |t|
    t.string   "logInCode"
    t.string   "searchOption"
    t.string   "querySuggestion"
    t.integer  "timesUsed"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "search_intent"
  end

  create_table "queries", force: :cascade do |t|
    t.string   "originalQueryString"
    t.json     "topLinks"
    t.json     "linksClicked"
    t.integer  "student_user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "updatedQueryString"
  end

  add_index "queries", ["student_user_id"], name: "index_queries_on_student_user_id", using: :btree

  create_table "student_users", force: :cascade do |t|
    t.string   "logInCode"
    t.string   "searchOption"
    t.string   "querySuggestion"
    t.integer  "age"
    t.string   "grade"
    t.string   "school"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "search_intent"
  end

  add_foreign_key "queries", "student_users"
end
