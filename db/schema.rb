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

ActiveRecord::Schema.define(version: 2021_12_15_153304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "eaten_at"
    t.string "item"
    t.integer "amount"
    t.string "measurement_type"
    t.boolean "remove_from_kitchen"
    t.boolean "add_to_shopping_list"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_food_logs_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "food_group"
    t.string "description"
    t.string "imgurl"
    t.string "item"
    t.integer "amount"
    t.string "measurement_type"
    t.boolean "in_kitchen"
    t.boolean "in_fridge"
    t.boolean "in_freezer"
    t.boolean "in_pantry"
    t.boolean "in_shopping_list"
    t.bigint "recipe_id"
    t.bigint "food_log_id"
    t.bigint "kitchen_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_log_id"], name: "index_items_on_food_log_id"
    t.index ["kitchen_id"], name: "index_items_on_kitchen_id"
    t.index ["recipe_id"], name: "index_items_on_recipe_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "kitchens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "fridge"
    t.boolean "freezer"
    t.boolean "pantry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_kitchens_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "friendship_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friendship_id"], name: "index_messages_on_friendship_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.integer "length_minutes"
    t.text "instructions"
    t.boolean "favorite"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "item"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shopping_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.integer "house_number"
    t.string "address"
    t.string "address_extras"
    t.string "city"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "food_logs", "users"
  add_foreign_key "items", "food_logs"
  add_foreign_key "items", "kitchens"
  add_foreign_key "items", "recipes"
  add_foreign_key "items", "users"
  add_foreign_key "kitchens", "users"
  add_foreign_key "messages", "friendships"
  add_foreign_key "messages", "users"
  add_foreign_key "recipes", "users"
  add_foreign_key "shopping_lists", "users"
end
