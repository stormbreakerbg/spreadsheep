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

ActiveRecord::Schema.define(version: 20150219081759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cells", force: :cascade do |t|
    t.integer "sheet_id"
    t.integer "row",              null: false
    t.integer "column",           null: false
    t.string  "content"
    t.string  "background_color"
    t.string  "foreground_color"
    t.integer "font_size"
    t.integer "alignment"
  end

  add_index "cells", ["sheet_id", "row", "column"], name: "index_cells_on_sheet_id_and_row_and_column", unique: true, using: :btree
  add_index "cells", ["sheet_id"], name: "index_cells_on_sheet_id", using: :btree

  create_table "directories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "creator_id", null: false
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "directories", ["creator_id"], name: "index_directories_on_creator_id", using: :btree
  add_index "directories", ["parent_id"], name: "index_directories_on_parent_id", using: :btree

  create_table "row_column_states", force: :cascade do |t|
    t.integer "sheet_id"
    t.integer "index"
    t.integer "type"
    t.integer "width"
  end

  add_index "row_column_states", ["sheet_id", "type", "index"], name: "index_row_column_states_on_sheet_id_and_type_and_index", unique: true, using: :btree

  create_table "sheets", force: :cascade do |t|
    t.integer  "directory_id"
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "public",       default: false
  end

  create_table "user_shares", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "directory_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "full_name",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
