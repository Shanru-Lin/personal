# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_20_020118) do
  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.integer "challenge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount", default: 0
    t.integer "user_id", null: false
    t.index ["challenge_id"], name: "index_activities_on_challenge_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "badge_awards", force: :cascade do |t|
    t.integer "badge_id", null: false
    t.integer "user_id", null: false
    t.integer "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_badge_awards_on_badge_id"
    t.index ["challenge_id"], name: "index_badge_awards_on_challenge_id"
    t.index ["user_id"], name: "index_badge_awards_on_user_id"
  end

  create_table "badges", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "category_id"
    t.integer "count"
    t.string "goal_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_badges_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string "name", null: false
    t.integer "category_id", null: false
    t.integer "goal", default: 0
    t.integer "progress", default: 0
    t.date "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "units"
    t.integer "user_id", null: false
    t.index ["category_id"], name: "index_challenges_on_category_id"
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "challenges"
  add_foreign_key "activities", "users"
  add_foreign_key "badge_awards", "badges"
  add_foreign_key "badge_awards", "users"
  add_foreign_key "challenges", "categories"
  add_foreign_key "challenges", "users"
end
