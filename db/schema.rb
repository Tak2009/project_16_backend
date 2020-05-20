# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_14_160146) do

  create_table "pubs", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone"
    t.string "address"
    t.string "postcode"
    t.string "situation"
    t.string "message_to_supporters"
    t.string "image_pic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "supporters", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone"
    t.string "address"
    t.string "postcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "name"
    t.string "message"
    t.integer "pub_id", null: false
    t.integer "supporter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pub_id"], name: "index_tickets_on_pub_id"
    t.index ["supporter_id"], name: "index_tickets_on_supporter_id"
  end

  add_foreign_key "tickets", "pubs"
  add_foreign_key "tickets", "supporters"
end
