class InitScheme < ActiveRecord::Migration[6.0]
  def change

    create_table "taggings" do |t|
      t.integer  "tag_id"
      t.string   "taggable_type"
      t.integer  "taggable_id"
      t.string   "tagger_type"
      t.integer  "tagger_id"
      t.string   "context",       limit: 128
      t.datetime "created_at"
      t.index ["context"], name: "index_taggings_on_context", using: :btree
      t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
      t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
      t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
      t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
      t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
      t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
      t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
      t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
    end

    create_table "tags" do |t|
      t.string  "name"
      t.integer "taggings_count", default: 0
      t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
    end

    create_table "user_app_version_infos", force: :cascade do |t|
      t.integer  "user_id",     null: false
      t.string   "os_info"
      t.string   "device_info"
      t.string   "app_version"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
      t.index ["user_id"], name: "index_user_app_version_infos_on_user_id", unique: true, using: :btree
    end

    create_table "user_billings", force: :cascade do |t|
      t.integer  "user_id"
      t.text     "address",    limit: 65535
      t.string   "name"
      t.string   "tel"
      t.datetime "created_at",               null: false
      t.datetime "updated_at",               null: false
      t.index ["user_id"], name: "index_user_billings_on_user_id", using: :btree
    end

    create_table "user_income_certifications", force: :cascade do |t|
      t.integer  "user_id"
      t.string   "document_image",                                           null: false
      t.integer  "document_image_status",                        default: 0, null: false
      t.datetime "document_image_confirmed_at"
      t.string   "document_image_was_accepted"
      t.string   "document_image_was_rejected"
      t.text     "document_image_rejected_reason", limit: 65535
      t.datetime "created_at",                                               null: false
      t.datetime "updated_at",                                               null: false
      t.string   "document_image_before"
      t.integer  "document_image_admin_user_id"
      t.index ["user_id"], name: "index_user_income_certifications_on_user_id", using: :btree
    end

    create_table "user_invite_codes", force: :cascade do |t|
      t.integer  "user_id"
      t.string   "invite_code"
      t.boolean  "used",            default: false
      t.integer  "invited_user_id"
      t.datetime "created_at",                      null: false
      t.datetime "updated_at",                      null: false
      t.index ["invite_code"], name: "index_user_invite_codes_on_invite_code", unique: true, using: :btree
      t.index ["invited_user_id"], name: "index_user_invite_codes_on_invited_user_id", unique: true, using: :btree
      t.index ["user_id"], name: "index_user_invite_codes_on_user_id", using: :btree
    end

    create_table "user_ios_purchase_histories", force: :cascade do |t|
      t.integer  "user_id"
      t.string   "product_id_str"
      t.datetime "created_at",                            null: false
      t.datetime "updated_at",                            null: false
      t.text     "base64_receipt",          limit: 16777215, null: false
      t.integer  "result_type"
      t.string   "result_message"
      t.bigint   "transaction_id"
      t.bigint   "original_transaction_id"
      t.index ["product_id_str", "transaction_id"], name: "transaction_unique_index", unique: true, using: :btree
      t.index ["product_id_str"], name: "index_user_ios_purchase_histories_on_product_id_str", using: :btree
      t.index ["user_id"], name: "index_user_ios_purchase_histories_on_user_id", using: :btree
    end

    create_table "user_notification_reads", force: :cascade do |t|
      t.integer  "user_id"
      t.string   "notificatable_type"
      t.integer  "notificatable_id"
      t.datetime "created_at",         null: false
      t.datetime "updated_at",         null: false
      t.index ["notificatable_type", "notificatable_id"], name: "user_notification_reads_index", using: :btree
      t.index ["user_id"], name: "index_user_notification_reads_on_user_id", using: :btree
    end

    create_table "user_notifications", force: :cascade do |t|
      t.integer  "user_id"
      t.integer  "notice_type"
      t.string   "title"
      t.text     "body",        limit: 65535
      t.datetime "created_at",                null: false
      t.datetime "updated_at",                null: false
      t.index ["notice_type"], name: "index_user_notifications_on_notice_type", using: :btree
      t.index ["user_id"], name: "index_user_notifications_on_user_id", using: :btree
    end

    create_table "user_notifies", force: :cascade do |t|
      t.integer  "user_id",                                   null: false
      t.boolean  "match_push_notify",         default: true,  null: false
      t.boolean  "match_mail_notify",         default: false, null: false
      t.boolean  "relation_push_notify",      default: true,  null: false
      t.boolean  "relation_mail_notify",      default: false, null: false
      t.boolean  "notification_push_notify",  default: true,  null: false
      t.boolean  "notification_mail_notify",  default: false, null: false
      t.boolean  "match_message_push_notify", default: true,  null: false
      t.boolean  "match_message_mail_notify", default: false, null: false
      t.datetime "created_at",                                null: false
      t.datetime "updated_at",                                null: false
      t.boolean  "visitor_push_notify",       default: true,  null: false
      t.boolean  "visitor_mail_notify",       default: false, null: false
      t.index ["user_id"], name: "index_user_notifies_on_user_id", using: :btree
    end

    create_table "user_payments", force: :cascade do |t|
      t.integer  "user_id"
      t.datetime "start_at"
      t.datetime "end_at"
      t.integer  "payment_type"
      t.boolean  "enabled",      default: true
      t.datetime "created_at",                  null: false
      t.datetime "updated_at",                  null: false
      t.index ["enabled"], name: "index_user_payments_on_enabled", using: :btree
      t.index ["payment_type"], name: "index_user_payments_on_payment_type", using: :btree
      t.index ["user_id"], name: "index_user_payments_on_user_id", using: :btree
    end

    create_table "user_pickups", force: :cascade do |t|
      t.integer  "user_id"
      t.integer  "target_user_id", null: false
      t.datetime "created_at",     null: false
      t.datetime "updated_at",     null: false
      t.index ["target_user_id"], name: "index_user_pickups_on_target_user_id", using: :btree
      t.index ["user_id", "target_user_id"], name: "index_user_pickups_on_user_id_and_target_user_id", unique: true, using: :btree
      t.index ["user_id"], name: "index_user_pickups_on_user_id", using: :btree
    end

    create_table "user_point_payments", force: :cascade do |t|
      t.integer  "user_id"
      t.datetime "end_at"
      t.integer  "process_type"
      t.integer  "remain_point"
      t.integer  "point"
      t.boolean  "enabled",      default: true
      t.datetime "process_date"
      t.datetime "created_at",                  null: false
      t.datetime "updated_at",                  null: false
      t.index ["enabled"], name: "index_user_point_payments_on_enabled", using: :btree
      t.index ["end_at"], name: "index_user_point_payments_on_end_at", using: :btree
      t.index ["process_date"], name: "index_user_point_payments_on_process_date", using: :btree
      t.index ["process_type"], name: "index_user_point_payments_on_process_type", using: :btree
      t.index ["user_id"], name: "index_user_point_payments_on_user_id", using: :btree
    end

    create_table "user_ranks", force: :cascade do |t|
      t.integer  "user_id"
      t.integer  "rank",                      default: 0
      t.integer  "face_score",                default: 0
      t.integer  "profile_comment_score",     default: 0
      t.integer  "profile_image_score",       default: 0
      t.integer  "charge_score",              default: 0
      t.integer  "message_score",             default: 0
      t.integer  "violation_score",           default: 0
      t.integer  "outcomming_relation_score", default: 0
      t.integer  "incomming_relation_score",  default: 0
      t.integer  "last_login_score",          default: 0
      t.datetime "created_at",                            null: false
      t.datetime "updated_at",                            null: false
      t.index ["user_id"], name: "index_user_ranks_on_user_id", using: :btree
    end

    create_table "user_templates", force: :cascade do |t|
      t.string   "name"
      t.string   "background_image"
      t.datetime "created_at",       null: false
      t.datetime "updated_at",       null: false
    end

    create_table "user_violations", force: :cascade do |t|
      t.integer  "user_id",                                              null: false
      t.integer  "target_user_id",                                       null: false
      t.integer  "violation_category_id",                                null: false
      t.text     "reason",                 limit: 65535
      t.boolean  "boolean",                              default: false
      t.datetime "created_at",                                           null: false
      t.datetime "updated_at",                                           null: false
      t.integer  "reason_status",                        default: 0,     null: false
      t.datetime "reason_confirmed_at"
      t.text     "reason_was_accepted",    limit: 65535
      t.text     "reason_was_rejected",    limit: 65535
      t.text     "reason_before",          limit: 65535
      t.text     "reason_rejected_reason", limit: 65535
      t.index ["target_user_id"], name: "index_user_violations_on_target_user_id", using: :btree
      t.index ["user_id", "target_user_id"], name: "index_user_violations_on_user_id_on_target_user_id", unique: true, using: :btree
      t.index ["user_id"], name: "index_user_violations_on_user_id", using: :btree
    end

    create_table "user_login_bonuses", force: :cascade do |t|
      t.integer  "user_id"
      t.datetime "daily_login_date"
      t.datetime "daily_serial_login_beginning_date"
      t.integer  "daily_serial_login_count"
      t.datetime "created_at",                        null: false
      t.datetime "updated_at",                        null: false
      t.index ["user_id"], name: "index_user_login_bonuses_on_user_id", using: :btree
    end

    create_table "admin_user_notifies", force: :cascade do |t|
      t.integer  "user_id",                                  null: false
      t.boolean  "user_certification_notify", default: true, null: false
      t.boolean  "profile_image_notify",      default: true, null: false
      t.boolean  "user_profile_notify",       default: true, null: false
      t.boolean  "inquiry_notify",            default: true, null: false
      t.datetime "created_at",                               null: false
      t.datetime "updated_at",                               null: false
      t.index ["user_id"], name: "index_admin_user_notifies_on_user_id", using: :btree
    end

    create_table "admin_user_probations", force: :cascade do |t|
      t.integer  "user_id"
      t.text     "comment",    limit: 65535
      t.datetime "created_at",               null: false
      t.datetime "updated_at",               null: false
      t.index ["user_id"], name: "index_admin_user_probations_on_user_id", using: :btree
    end

    create_table "user_android_purchase_histories", force: :cascade do |t|
      t.integer  "user_id"
      t.string   "product_id_str",                               null: false
      t.string   "order_id",                                     null: false
      t.string   "purchase_token",                               null: false
      t.text     "purchase_data",  limit: 65535,                 null: false
      t.text     "signature",      limit: 65535,                 null: false
      t.integer  "result_type"
      t.string   "result_message"
      t.boolean  "skip",                         default: false
      t.datetime "created_at",                                   null: false
      t.datetime "updated_at",                                   null: false
      t.index ["order_id"], name: "index_user_android_purchase_histories_on_order_id", using: :btree
      t.index ["product_id_str"], name: "index_user_android_purchase_histories_on_product_id_str", using: :btree
      t.index ["purchase_token"], name: "index_user_android_purchase_histories_on_purchase_token", using: :btree
      t.index ["user_id"], name: "index_user_android_purchase_histories_on_user_id", using: :btree
    end

  end
end
