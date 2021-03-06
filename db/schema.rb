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

ActiveRecord::Schema.define(version: 20160418220946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "semester"
    t.integer  "lecturer_id"
    t.integer  "studyhours"
    t.integer  "credits"
    t.string   "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "ects_url"
  end

  add_index "courses", ["lecturer_id"], name: "index_courses_on_lecturer_id", using: :btree

  create_table "courses_programmes", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "programme_id"
  end

  add_index "courses_programmes", ["course_id", "programme_id"], name: "index_courses_programmes_on_course_id_and_programme_id", unique: true, using: :btree
  add_index "courses_programmes", ["course_id"], name: "index_courses_programmes_on_course_id", using: :btree
  add_index "courses_programmes", ["programme_id"], name: "index_courses_programmes_on_programme_id", using: :btree

  create_table "faculties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
  end

  create_table "lecturers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
    t.string   "url"
  end

  create_table "programmes", force: :cascade do |t|
    t.string   "name"
    t.integer  "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
    t.string   "url"
  end

  add_index "programmes", ["faculty_id"], name: "index_programmes_on_faculty_id", using: :btree

  add_foreign_key "courses", "lecturers"
  add_foreign_key "programmes", "faculties"
end
