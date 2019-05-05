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

ActiveRecord::Schema.define(version: 20180412025902) do

  create_table "eggs", force: :cascade do |t|
    t.string  "color"
    t.integer "nest_id"
    t.integer "sparrow_id"
  end

  add_index "eggs", ["nest_id"], name: "index_eggs_on_nest_id"
  add_index "eggs", ["sparrow_id"], name: "index_eggs_on_sparrow_id"

  create_table "materials", force: :cascade do |t|
    t.string  "description"
    t.integer "nest_id"
  end

  add_index "materials", ["nest_id"], name: "index_materials_on_nest_id"

  create_table "nest_materials", force: :cascade do |t|
    t.integer "nest_id"
    t.integer "material_id"
  end

  add_index "nest_materials", ["material_id"], name: "index_nest_materials_on_material_id"
  add_index "nest_materials", ["nest_id"], name: "index_nest_materials_on_nest_id"

  create_table "nests", force: :cascade do |t|
    t.string  "location"
    t.integer "sparrow_id"
  end

  add_index "nests", ["sparrow_id"], name: "index_nests_on_sparrow_id"

  create_table "post_tags", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sparrows", force: :cascade do |t|
    t.string "name"
    t.string "species"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
