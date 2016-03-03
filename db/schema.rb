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

ActiveRecord::Schema.define(version: 20160303104956) do

  create_table "entities", force: :cascade do |t|
    t.string   "type"
    t.integer  "entity_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "entities", ["entity_type_id"], name: "index_entities_on_entity_type_id"

  create_table "entity_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "value"
    t.integer  "entity_id"
    t.integer  "property_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "properties", ["entity_id"], name: "index_properties_on_entity_id"
  add_index "properties", ["property_type_id"], name: "index_properties_on_property_type_id"

  create_table "property_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "entity_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "property_types", ["entity_type_id"], name: "index_property_types_on_entity_type_id"

end
