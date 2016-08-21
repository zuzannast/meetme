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

ActiveRecord::Schema.define(version: 20160821152746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["event_id"], name: "index_comments_on_event_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "showtime_id"
    t.integer  "organiser_id"
    t.string   "title"
  end

  create_table "followers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "followed_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.integer "genre_id"
    t.integer "movie_id"
  end

  add_index "genres_movies", ["genre_id"], name: "index_genres_movies_on_genre_id", using: :btree
  add_index "genres_movies", ["movie_id"], name: "index_genres_movies_on_movie_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "origin"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "participants", ["event_id"], name: "index_participants_on_event_id", using: :btree
  add_index "participants", ["user_id"], name: "index_participants_on_user_id", using: :btree

  create_table "profile_genres", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "genre_id"
  end

  add_index "profile_genres", ["genre_id"], name: "index_profile_genres_on_genre_id", using: :btree
  add_index "profile_genres", ["profile_id"], name: "index_profile_genres_on_profile_id", using: :btree

  create_table "profile_traits", force: :cascade do |t|
    t.integer "value"
    t.integer "profile_id"
    t.integer "trait_id"
  end

  add_index "profile_traits", ["profile_id"], name: "index_profile_traits_on_profile_id", using: :btree
  add_index "profile_traits", ["trait_id"], name: "index_profile_traits_on_trait_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["city_id"], name: "index_profiles_on_city_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "showtimes", force: :cascade do |t|
    t.string   "time"
    t.integer  "theater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "movie_id"
  end

  add_index "showtimes", ["movie_id"], name: "index_showtimes_on_movie_id", using: :btree
  add_index "showtimes", ["theater_id"], name: "index_showtimes_on_theater_id", using: :btree

  create_table "theaters", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "theaters", ["city_id"], name: "index_theaters_on_city_id", using: :btree

  create_table "traits", force: :cascade do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "city_id"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
