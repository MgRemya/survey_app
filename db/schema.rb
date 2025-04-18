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

ActiveRecord::Schema[7.1].define(version: 2025_04_09_163048) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_categories_on_survey_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_questions_on_category_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_surveys_on_creator_id"
  end

  create_table "user_survey_responses", force: :cascade do |t|
    t.bigint "user_survey_id"
    t.bigint "question_id"
    t.bigint "answer_id"
    t.bigint "category_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_user_survey_responses_on_answer_id"
    t.index ["category_id"], name: "index_user_survey_responses_on_category_id"
    t.index ["question_id"], name: "index_user_survey_responses_on_question_id"
    t.index ["user_survey_id"], name: "index_user_survey_responses_on_user_survey_id"
  end

  create_table "user_surveys", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_user_surveys_on_survey_id"
    t.index ["user_id"], name: "index_user_surveys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "password_digest"
    t.string "role", default: "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "categories", "surveys"
  add_foreign_key "questions", "categories"
  add_foreign_key "surveys", "users", column: "creator_id"
  add_foreign_key "user_survey_responses", "answers"
  add_foreign_key "user_survey_responses", "categories"
  add_foreign_key "user_survey_responses", "questions"
  add_foreign_key "user_survey_responses", "user_surveys"
  add_foreign_key "user_surveys", "surveys"
  add_foreign_key "user_surveys", "users"
end
