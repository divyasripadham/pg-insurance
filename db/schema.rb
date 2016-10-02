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

ActiveRecord::Schema.define(version: 20161001020944) do

  create_table "estimates", force: :cascade do |t|
    t.text     "rules_applied"
    t.integer  "person_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.decimal  "amount",        precision: 8, scale: 2
  end

  add_index "estimates", ["person_id"], name: "index_estimates_on_person_id"

  create_table "locations", force: :cascade do |t|
    t.string   "city"
    t.string   "state"
    t.integer  "coast"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.integer  "age"
    t.integer  "gender"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_healths", force: :cascade do |t|
    t.string   "condition"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "person_healths", ["person_id"], name: "index_person_healths_on_person_id"

end
