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

ActiveRecord::Schema.define(version: 20140312154017) do

  create_table "appointments", force: true do |t|
    t.integer  "event_id"
    t.integer  "medical_center_id"
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "medical_center_id"
    t.string   "speciality"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "starts_at"
    t.datetime "end_at"
    t.boolean  "all_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_centers", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
  end

  create_table "patients", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "center_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "rol"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.integer  "medical_center_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
