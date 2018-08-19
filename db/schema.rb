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

ActiveRecord::Schema.define(version: 2018_08_17_223444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.integer "weeks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "phase"
    t.integer "week"
    t.integer "day"
    t.string "swim_hours"
    t.string "swim"
    t.string "bike_hours"
    t.string "bike"
    t.string "run_hours"
    t.string "run"
    t.integer "total_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "swims", force: :cascade do |t|
    t.string "session_number"
    t.string "warm_up"
    t.string "drills_1"
    t.string "main_set"
    t.string "drills_2"
    t.string "cool_down"
    t.integer "total_distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_plans", force: :cascade do |t|
    t.integer "user_id"
    t.integer "plan_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "race_date"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "phase"
    t.integer "week"
    t.integer "day"
    t.integer "swim_hours"
    t.string "swim"
    t.integer "bike_hours"
    t.string "bike"
    t.integer "run_hours"
    t.string "run"
    t.integer "total_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plan_id"
  end

end
