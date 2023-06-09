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

ActiveRecord::Schema.define(version: 2023_04_03_100340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apples", force: :cascade do |t|
    t.bigint "basket_id"
    t.string "variety"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["basket_id"], name: "index_apples_on_basket_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.integer "capacity"
    t.string "fill_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oranges", force: :cascade do |t|
    t.bigint "basket_id"
    t.string "variety"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["basket_id"], name: "index_oranges_on_basket_id"
  end

  add_foreign_key "apples", "baskets"
  add_foreign_key "oranges", "baskets"
end
