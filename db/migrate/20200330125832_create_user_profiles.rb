class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table "user_profiles", force: :cascade do |t|
      t.integer  "user_id"
      t.string   "name"
      t.integer  "sex"
      t.string   "comment",                        limit: 2000
      t.datetime "age_confirmed_at"
      t.datetime "birthday"
      t.integer  "prof_address_id"
      t.integer  "height"
      t.integer  "prof_job_id"
      t.integer  "blood"
      t.datetime "created_at",                                               null: false
      t.datetime "updated_at",                                               null: false
      t.string   "icon"
      t.text     "dream",                          limit: 65535
      t.text     "school_name",                    limit: 65535
      t.text     "hobby",                          limit: 65535
      t.integer  "prof_annual_income_id",                        default: 1
      t.integer  "prof_drinking_habit_id",                       default: 1
      t.integer  "prof_expect_support_money_id",                 default: 1
      t.integer  "prof_educational_background_id",               default: 1
      t.integer  "prof_figure_id",                               default: 1
      t.integer  "prof_first_date_cost_id",                      default: 1
      t.integer  "prof_have_child_id",                           default: 1
      t.integer  "prof_holiday_id",                              default: 1
      t.integer  "prof_marriage_id",                             default: 1
      t.integer  "prof_personality_id",                          default: 1
      t.integer  "prof_request_until_meet_id",                   default: 1
      t.integer  "prof_smoking_habit_id",                        default: 1
      t.integer  "prof_birth_place_id",                          default: 1
      t.text     "job_name",                       limit: 65535
      t.integer  "comment_status",                               default: 0, null: false
      t.datetime "comment_confirmed_at"
      t.string   "comment_was_accepted",           limit: 2000
      t.string   "comment_was_rejected",           limit: 2000
      t.text     "comment_rejected_reason",        limit: 65535
      t.integer  "dream_status",                                 default: 0, null: false
      t.datetime "dream_confirmed_at"
      t.string   "dream_was_accepted"
      t.string   "dream_was_rejected"
      t.text     "dream_rejected_reason",          limit: 65535
      t.integer  "school_name_status",                           default: 0, null: false
      t.datetime "school_name_confirmed_at"
      t.string   "school_name_was_accepted"
      t.string   "school_name_was_rejected"
      t.text     "school_name_rejected_reason",    limit: 65535
      t.integer  "hobby_status",                                 default: 0, null: false
      t.datetime "hobby_confirmed_at"
      t.string   "hobby_was_accepted"
      t.string   "hobby_was_rejected"
      t.text     "hobby_rejected_reason",          limit: 65535
      t.integer  "job_name_status",                              default: 0, null: false
      t.datetime "job_name_confirmed_at"
      t.string   "job_name_was_accepted"
      t.string   "job_name_was_rejected"
      t.text     "job_name_rejected_reason",       limit: 65535
      t.string   "background_image"
      t.string   "tweet"
      t.integer  "tweet_status",                                 default: 0, null: false
      t.datetime "tweet_confirmed_at"
      t.string   "tweet_was_accepted"
      t.string   "tweet_was_rejected"
      t.text     "tweet_rejected_reason",          limit: 65535
      t.integer  "user_template_id"
      t.string   "comment_before",                 limit: 2000
      t.string   "dream_before"
      t.string   "school_name_before"
      t.string   "hobby_before"
      t.string   "job_name_before"
      t.string   "tweet_before"
      t.datetime "birthday_updated_at"
      t.datetime "income_confirmed_at"
      t.integer  "comment_admin_user_id"
      t.integer  "dream_admin_user_id"
      t.integer  "school_name_admin_user_id"
      t.integer  "hobby_admin_user_id"
      t.integer  "job_name_admin_user_id"
      t.integer  "tweet_admin_user_id"
      t.string   "good_place"
      t.integer  "good_place_status",                            default: 3
      t.text     "good_place_rejected_reason",     limit: 65535
      t.string   "good_place_was_accepted"
      t.string   "good_place_was_rejected"
      t.datetime "good_place_confirmed_at"
      t.string   "good_place_before"
      t.integer  "good_place_admin_user_id"
      t.string   "date_place"
      t.integer  "date_place_status",                            default: 3
      t.text     "date_place_rejected_reason",     limit: 65535
      t.string   "date_place_was_accepted"
      t.string   "date_place_was_rejected"
      t.datetime "date_place_confirmed_at"
      t.string   "date_place_before"
      t.integer  "date_place_admin_user_id"
      t.boolean  "meet_at_today_dinner",                         default: false, null: false
      t.boolean  "meet_at_today_lunch",                          default: false, null: false
      t.boolean  "meet_at_today_tea",                            default: false, null: false
      t.index ["blood"], name: "index_user_profiles_on_blood", using: :btree
      t.index ["height"], name: "index_user_profiles_on_height", using: :btree
      t.index ["prof_address_id"], name: "index_user_profiles_on_prof_address_id", using: :btree
      t.index ["prof_annual_income_id"], name: "index_user_profiles_on_prof_annual_income_id", using: :btree
      t.index ["prof_birth_place_id"], name: "index_user_profiles_on_prof_birth_place_id", using: :btree
      t.index ["prof_drinking_habit_id"], name: "index_user_profiles_on_prof_drinking_habit_id", using: :btree
      t.index ["prof_educational_background_id"], name: "index_user_profiles_on_prof_educational_background_id", using: :btree
      t.index ["prof_expect_support_money_id"], name: "index_user_profiles_on_prof_expect_support_money_id", using: :btree
      t.index ["prof_figure_id"], name: "index_user_profiles_on_prof_figure_id", using: :btree
      t.index ["prof_first_date_cost_id"], name: "index_user_profiles_on_prof_first_date_cost_id", using: :btree
      t.index ["prof_have_child_id"], name: "index_user_profiles_on_prof_have_child_id", using: :btree
      t.index ["prof_holiday_id"], name: "index_user_profiles_on_prof_holiday_id", using: :btree
      t.index ["prof_job_id"], name: "index_user_profiles_on_prof_job_id", using: :btree
      t.index ["prof_marriage_id"], name: "index_user_profiles_on_prof_marriage_id", using: :btree
      t.index ["prof_personality_id"], name: "index_user_profiles_on_prof_personality_id", using: :btree
      t.index ["prof_request_until_meet_id"], name: "index_user_profiles_on_prof_request_until_meet_id", using: :btree
      t.index ["prof_smoking_habit_id"], name: "index_user_profiles_on_prof_smoking_habit_id", using: :btree
      t.index ["sex"], name: "index_user_profiles_on_sex", using: :btree
      t.index ["user_id"], name: "index_user_profiles_on_user_id", using: :btree
    end
  end
end
