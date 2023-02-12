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

ActiveRecord::Schema.define(version: 2023_02_12_120704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "subject"
    t.string "answer"
    t.bigint "user_id", null: false #professor_id
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_quiz_questions_on_question_id"
    t.index ["quiz_id"], name: "index_quiz_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.string "subject"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_id", null: false
    t.index ["team_id"], name: "index_quizzes_on_team_id"
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "questions_answered"
    t.integer "right_answers"
    t.integer "wrong_answers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_questions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_student_questions_on_question_id"
    t.index ["user_id"], name: "index_student_questions_on_user_id"
  end

  create_table "student_quizzes", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_student_quizzes_on_quiz_id"
    t.index ["user_id"], name: "index_student_quizzes_on_user_id"
  end

  create_table "student_teams", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_student_teams_on_team_id"
    t.index ["user_id"], name: "index_student_teams_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "enrollment"
    t.boolean "is_admin"
    t.boolean "is_student"
    t.boolean "is_teacher"
    t.bigint "statistic_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["statistic_id"], name: "index_users_on_statistic_id"
  end

  add_foreign_key "questions", "users"
  add_foreign_key "quiz_questions", "questions"
  add_foreign_key "quiz_questions", "quizzes"
  add_foreign_key "quizzes", "teams"
  add_foreign_key "quizzes", "users"
  add_foreign_key "student_questions", "questions"
  add_foreign_key "student_questions", "users"
  add_foreign_key "student_quizzes", "quizzes"
  add_foreign_key "student_quizzes", "users"
  add_foreign_key "student_teams", "teams"
  add_foreign_key "student_teams", "users"
  add_foreign_key "teams", "users"
end
