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

ActiveRecord::Schema.define(version: 2021_11_09_010815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_educators", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_class_educators_on_course_id"
    t.index ["user_id"], name: "index_class_educators_on_user_id"
  end

  create_table "class_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.bigint "organisation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_class_lists_on_course_id"
    t.index ["organisation_id"], name: "index_class_lists_on_organisation_id"
    t.index ["user_id"], name: "index_class_lists_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false
    t.text "contents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url"
    t.integer "difficulty"
    t.bigint "creator_id", null: false
    t.index ["creator_id"], name: "index_courses_on_creator_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_likes_on_course_id"
    t.index ["user_id", "course_id"], name: "index_likes_on_user_id_and_course_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.bigint "user_id", null: false
    t.bigint "courses_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["courses_id"], name: "index_organisations_on_courses_id"
    t.index ["user_id"], name: "index_organisations_on_user_id"
  end

  create_table "subscribes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_subscribes_on_course_id"
    t.index ["user_id", "course_id"], name: "index_subscribes_on_user_id_and_course_id", unique: true
    t.index ["user_id"], name: "index_subscribes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name", limit: 25
    t.string "timezone"
    t.string "display_name"
    t.text "about"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "wishes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_wishes_on_course_id"
    t.index ["user_id", "course_id"], name: "index_wishes_on_user_id_and_course_id", unique: true
    t.index ["user_id"], name: "index_wishes_on_user_id"
  end

  add_foreign_key "class_educators", "courses"
  add_foreign_key "class_educators", "users"
  add_foreign_key "class_lists", "courses"
  add_foreign_key "class_lists", "organisations"
  add_foreign_key "class_lists", "users"
  add_foreign_key "likes", "courses"
  add_foreign_key "likes", "users"
  add_foreign_key "organisations", "courses", column: "courses_id"
  add_foreign_key "organisations", "users"
  add_foreign_key "subscribes", "courses"
  add_foreign_key "subscribes", "users"
  add_foreign_key "wishes", "courses"
  add_foreign_key "wishes", "users"
end
