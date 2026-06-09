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

ActiveRecord::Schema[8.1].define(version: 2026_06_09_010600) do
  create_table "achievements", force: :cascade do |t|
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.text "description", null: false
    t.integer "lesson_completion_requirement"
    t.string "name", null: false
    t.integer "streak_requirement"
    t.datetime "updated_at", null: false
    t.integer "xp_requirement", default: 0, null: false
    t.index ["code"], name: "index_achievements_on_code", unique: true
    t.index ["name"], name: "index_achievements_on_name", unique: true
  end

  create_table "lesson_completions", force: :cascade do |t|
    t.datetime "completed_at", null: false
    t.datetime "created_at", null: false
    t.integer "lesson_id", null: false
    t.integer "score", default: 0, null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["completed_at"], name: "index_lesson_completions_on_completed_at"
    t.index ["lesson_id"], name: "index_lesson_completions_on_lesson_id"
    t.index ["user_id", "lesson_id"], name: "index_lesson_completions_on_user_id_and_lesson_id", unique: true
    t.index ["user_id"], name: "index_lesson_completions_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.text "description", null: false
    t.integer "position", default: 0, null: false
    t.integer "subject_id", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.integer "xp_reward", default: 50, null: false
    t.index ["active"], name: "index_lessons_on_active"
    t.index ["subject_id", "position"], name: "index_lessons_on_subject_id_and_position"
    t.index ["subject_id"], name: "index_lessons_on_subject_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "correct_answer", null: false
    t.datetime "created_at", null: false
    t.text "explanation"
    t.integer "kind", default: 0, null: false
    t.integer "lesson_id", null: false
    t.text "option_a"
    t.text "option_b"
    t.text "option_c"
    t.text "option_d"
    t.integer "position", default: 0, null: false
    t.text "statement", null: false
    t.datetime "updated_at", null: false
    t.index ["kind"], name: "index_questions_on_kind"
    t.index ["lesson_id", "position"], name: "index_questions_on_lesson_id_and_position"
    t.index ["lesson_id"], name: "index_questions_on_lesson_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description", null: false
    t.string "name", null: false
    t.integer "position", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_subjects_on_name", unique: true
    t.index ["position"], name: "index_subjects_on_position"
  end

  create_table "user_achievements", force: :cascade do |t|
    t.integer "achievement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "unlocked_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["achievement_id"], name: "index_user_achievements_on_achievement_id"
    t.index ["unlocked_at"], name: "index_user_achievements_on_unlocked_at"
    t.index ["user_id", "achievement_id"], name: "index_user_achievements_on_user_id_and_achievement_id", unique: true
    t.index ["user_id"], name: "index_user_achievements_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "last_study_at"
    t.integer "level", default: 1, null: false
    t.string "name", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role", default: 0, null: false
    t.integer "streak", default: 0, null: false
    t.datetime "updated_at", null: false
    t.integer "xp", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["level"], name: "index_users_on_level"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["streak"], name: "index_users_on_streak"
    t.index ["xp"], name: "index_users_on_xp"
  end

  add_foreign_key "lesson_completions", "lessons"
  add_foreign_key "lesson_completions", "users"
  add_foreign_key "lessons", "subjects"
  add_foreign_key "questions", "lessons"
  add_foreign_key "user_achievements", "achievements"
  add_foreign_key "user_achievements", "users"
end
