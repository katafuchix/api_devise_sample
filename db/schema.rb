# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_30_125832) do

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.integer "role", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "masters", force: :cascade do |t|
    t.string "name"
    t.boolean "enabled"
    t.integer "sort_order"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "sex"
    t.string "comment", limit: 2000
    t.datetime "age_confirmed_at"
    t.datetime "birthday"
    t.integer "prof_address_id"
    t.integer "height"
    t.integer "prof_job_id"
    t.integer "blood"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
    t.text "dream", limit: 65535
    t.text "school_name", limit: 65535
    t.text "hobby", limit: 65535
    t.integer "prof_annual_income_id", default: 1
    t.integer "prof_drinking_habit_id", default: 1
    t.integer "prof_expect_support_money_id", default: 1
    t.integer "prof_educational_background_id", default: 1
    t.integer "prof_figure_id", default: 1
    t.integer "prof_first_date_cost_id", default: 1
    t.integer "prof_have_child_id", default: 1
    t.integer "prof_holiday_id", default: 1
    t.integer "prof_marriage_id", default: 1
    t.integer "prof_personality_id", default: 1
    t.integer "prof_request_until_meet_id", default: 1
    t.integer "prof_smoking_habit_id", default: 1
    t.integer "prof_birth_place_id", default: 1
    t.text "job_name", limit: 65535
    t.integer "comment_status", default: 0, null: false
    t.datetime "comment_confirmed_at"
    t.string "comment_was_accepted", limit: 2000
    t.string "comment_was_rejected", limit: 2000
    t.text "comment_rejected_reason", limit: 65535
    t.integer "dream_status", default: 0, null: false
    t.datetime "dream_confirmed_at"
    t.string "dream_was_accepted"
    t.string "dream_was_rejected"
    t.text "dream_rejected_reason", limit: 65535
    t.integer "school_name_status", default: 0, null: false
    t.datetime "school_name_confirmed_at"
    t.string "school_name_was_accepted"
    t.string "school_name_was_rejected"
    t.text "school_name_rejected_reason", limit: 65535
    t.integer "hobby_status", default: 0, null: false
    t.datetime "hobby_confirmed_at"
    t.string "hobby_was_accepted"
    t.string "hobby_was_rejected"
    t.text "hobby_rejected_reason", limit: 65535
    t.integer "job_name_status", default: 0, null: false
    t.datetime "job_name_confirmed_at"
    t.string "job_name_was_accepted"
    t.string "job_name_was_rejected"
    t.text "job_name_rejected_reason", limit: 65535
    t.string "background_image"
    t.string "tweet"
    t.integer "tweet_status", default: 0, null: false
    t.datetime "tweet_confirmed_at"
    t.string "tweet_was_accepted"
    t.string "tweet_was_rejected"
    t.text "tweet_rejected_reason", limit: 65535
    t.integer "user_template_id"
    t.string "comment_before", limit: 2000
    t.string "dream_before"
    t.string "school_name_before"
    t.string "hobby_before"
    t.string "job_name_before"
    t.string "tweet_before"
    t.datetime "birthday_updated_at"
    t.datetime "income_confirmed_at"
    t.integer "comment_admin_user_id"
    t.integer "dream_admin_user_id"
    t.integer "school_name_admin_user_id"
    t.integer "hobby_admin_user_id"
    t.integer "job_name_admin_user_id"
    t.integer "tweet_admin_user_id"
    t.index ["blood"], name: "index_user_profiles_on_blood"
    t.index ["height"], name: "index_user_profiles_on_height"
    t.index ["prof_address_id"], name: "index_user_profiles_on_prof_address_id"
    t.index ["prof_annual_income_id"], name: "index_user_profiles_on_prof_annual_income_id"
    t.index ["prof_birth_place_id"], name: "index_user_profiles_on_prof_birth_place_id"
    t.index ["prof_drinking_habit_id"], name: "index_user_profiles_on_prof_drinking_habit_id"
    t.index ["prof_educational_background_id"], name: "index_user_profiles_on_prof_educational_background_id"
    t.index ["prof_expect_support_money_id"], name: "index_user_profiles_on_prof_expect_support_money_id"
    t.index ["prof_figure_id"], name: "index_user_profiles_on_prof_figure_id"
    t.index ["prof_first_date_cost_id"], name: "index_user_profiles_on_prof_first_date_cost_id"
    t.index ["prof_have_child_id"], name: "index_user_profiles_on_prof_have_child_id"
    t.index ["prof_holiday_id"], name: "index_user_profiles_on_prof_holiday_id"
    t.index ["prof_job_id"], name: "index_user_profiles_on_prof_job_id"
    t.index ["prof_marriage_id"], name: "index_user_profiles_on_prof_marriage_id"
    t.index ["prof_personality_id"], name: "index_user_profiles_on_prof_personality_id"
    t.index ["prof_request_until_meet_id"], name: "index_user_profiles_on_prof_request_until_meet_id"
    t.index ["prof_smoking_habit_id"], name: "index_user_profiles_on_prof_smoking_habit_id"
    t.index ["sex"], name: "index_user_profiles_on_sex"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token"
    t.integer "status", default: 0, null: false
    t.datetime "deleted_at"
    t.index "\"statsu\"", name: "index_users_on_statsu"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
