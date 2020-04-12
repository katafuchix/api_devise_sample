class CreateProfileImages < ActiveRecord::Migration[6.0]
  def change
    create_table "profile_images", force: :cascade do |t|
      t.integer  "user_profile_id"
      t.text     "image",                 limit: 65535
      t.integer  "sort_order"
      t.datetime "created_at",                                      null: false
      t.datetime "updated_at",                                      null: false
      t.integer  "image_status",                        default: 0, null: false
      t.datetime "image_confirmed_at"
      t.text     "image_was_accepted",    limit: 65535
      t.text     "image_was_rejected",    limit: 65535
      t.text     "image_rejected_reason", limit: 65535
      t.text     "image_before",          limit: 65535
      t.integer  "image_admin_user_id"
      t.integer  "image_role",                          default: 0, null: false
      t.index ["user_profile_id", "sort_order"], name: "index_profile_images_on_user_profile_id_and_sort_order", using: :btree
      t.index ["user_profile_id"], name: "index_profile_images_on_user_profile_id", using: :btree
    end
  end
end
