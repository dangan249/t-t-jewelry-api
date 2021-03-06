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

ActiveRecord::Schema.define(version: 20141201010844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.string   "gender"
    t.string   "brand"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.integer  "brand_id"
    t.integer  "category_id"
    t.string   "thumbnail_url"
  end

  create_table "properties", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_values", force: true do |t|
    t.integer  "list_value_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "property_id"
    t.integer  "product_id"
  end

end
