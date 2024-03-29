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

ActiveRecord::Schema.define(version: 2021_11_24_061127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "channel_users", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_channel_users_on_channel_id"
    t.index ["user_id"], name: "index_channel_users_on_user_id"
  end

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_class_lists_on_course_id"
    t.index ["user_id"], name: "index_class_lists_on_user_id"
  end

  create_table "course_categories", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_course_categories_on_category_id"
    t.index ["course_id"], name: "index_course_categories_on_course_id"
  end

  create_table "course_channels", force: :cascade do |t|
    t.bigint "message_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_channels_on_course_id"
    t.index ["message_id"], name: "index_course_channels_on_message_id"
  end

  create_table "course_tags", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_tags_on_course_id"
    t.index ["tag_id"], name: "index_course_tags_on_tag_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false
    t.text "contents"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "cover"
    t.boolean "Ispremium"
    t.decimal "price", precision: 8, scale: 2
    t.boolean "isarchived"
    t.index ["Ispremium"], name: "index_courses_on_Ispremium"
    t.index ["title"], name: "index_courses_on_title"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "definitions", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "word_id", null: false
    t.string "type"
    t.index ["word_id"], name: "index_definitions_on_word_id"
  end

  create_table "flashcard_lists", force: :cascade do |t|
    t.bigint "flashcard_id"
    t.bigint "lesson_id", null: false
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flashcard_id"], name: "index_flashcard_lists_on_flashcard_id"
    t.index ["lesson_id"], name: "index_flashcard_lists_on_lesson_id"
  end

  create_table "flashcards", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "side_one"
    t.string "side_two"
    t.bigint "flashcard_list_id", null: false
    t.index ["flashcard_list_id"], name: "index_flashcards_on_flashcard_list_id"
  end

  create_table "grades", force: :cascade do |t|
    t.string "score"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_grades_on_user_id"
  end

  create_table "inboxes", force: :cascade do |t|
    t.bigint "message_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id"], name: "index_inboxes_on_message_id"
    t.index ["user_id"], name: "index_inboxes_on_user_id"
  end

  create_table "lesson_results", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "quiz_id", null: false
    t.bigint "user_id", null: false
    t.index ["lesson_id"], name: "index_lesson_results_on_lesson_id"
    t.index ["quiz_id"], name: "index_lesson_results_on_quiz_id"
    t.index ["user_id"], name: "index_lesson_results_on_user_id"
  end

  create_table "lesson_vocabs", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.bigint "word_id", null: false
    t.string "title"
    t.integer "language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_lesson_vocabs_on_lesson_id"
    t.index ["word_id"], name: "index_lesson_vocabs_on_word_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "course_id", null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
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

  create_table "messages", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_messages_on_channel_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
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

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.bigint "quiz_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "working_out_example"
    t.string "hint"
    t.string "user_answer"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.boolean "is_test"
    t.boolean "multiple_attempts"
    t.boolean "hints_enabled"
    t.index ["lesson_id"], name: "index_quizzes_on_lesson_id"
  end

  create_table "results", force: :cascade do |t|
    t.string "answer"
    t.string "question"
    t.bigint "user_id", null: false
    t.bigint "quiz_id", null: false
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_answer"
    t.index ["quiz_id"], name: "index_results_on_quiz_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
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

  create_table "tag_lists", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_tag_lists_on_course_id"
    t.index ["tag_id"], name: "index_tag_lists_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "display_name"
    t.text "about"
    t.string "image"
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
    t.string "timezone"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
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

  create_table "words", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "Wordtype"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "channel_users", "channels"
  add_foreign_key "channel_users", "users"
  add_foreign_key "class_educators", "courses"
  add_foreign_key "class_educators", "users"
  add_foreign_key "class_lists", "courses"
  add_foreign_key "class_lists", "users"
  add_foreign_key "course_categories", "categories"
  add_foreign_key "course_categories", "courses"
  add_foreign_key "course_channels", "courses"
  add_foreign_key "course_channels", "messages"
  add_foreign_key "course_tags", "courses"
  add_foreign_key "course_tags", "tags"
  add_foreign_key "courses", "users"
  add_foreign_key "definitions", "words"
  add_foreign_key "flashcard_lists", "lessons"
  add_foreign_key "flashcards", "flashcard_lists"
  add_foreign_key "grades", "users"
  add_foreign_key "inboxes", "messages"
  add_foreign_key "inboxes", "users"
  add_foreign_key "lesson_results", "lessons"
  add_foreign_key "lesson_results", "quizzes"
  add_foreign_key "lesson_results", "users"
  add_foreign_key "lesson_vocabs", "lessons"
  add_foreign_key "lesson_vocabs", "words"
  add_foreign_key "lessons", "courses"
  add_foreign_key "lessons", "users"
  add_foreign_key "likes", "courses"
  add_foreign_key "likes", "users"
  add_foreign_key "messages", "channels"
  add_foreign_key "messages", "users"
  add_foreign_key "organisations", "courses", column: "courses_id"
  add_foreign_key "organisations", "users"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "lessons"
  add_foreign_key "results", "quizzes"
  add_foreign_key "results", "users"
  add_foreign_key "subscribes", "courses"
  add_foreign_key "subscribes", "users"
  add_foreign_key "tag_lists", "courses"
  add_foreign_key "tag_lists", "tags"
  add_foreign_key "wishes", "courses"
  add_foreign_key "wishes", "users"
end
