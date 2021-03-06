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

ActiveRecord::Schema.define(version: 2018_10_24_093938) do

  create_table "journeys", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "leaving_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_locations_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.datetime "time_on_location"
    t.datetime "arrival_time"
    t.integer "journey_id"
    t.integer "duration_in_minutes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "init_location_id"
    t.integer "end_location_id"
    t.index ["end_location_id"], name: "index_routes_on_end_location_id"
    t.index ["init_location_id"], name: "index_routes_on_init_location_id"
    t.index ["journey_id"], name: "index_routes_on_journey_id"
  end

end
