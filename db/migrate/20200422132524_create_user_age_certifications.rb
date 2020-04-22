class CreateUserAgeCertifications < ActiveRecord::Migration[6.0]
  def change
    create_table "user_age_certifications", force: :cascade do |t|
      t.integer  "user_id"
      t.string   "document_image"
      t.datetime "created_at",                                               null: false
      t.datetime "updated_at",                                               null: false
      t.integer  "document_image_status",                        default: 0, null: false
      t.datetime "document_image_confirmed_at"
      t.string   "document_image_was_accepted"
      t.string   "document_image_was_rejected"
      t.text     "document_image_rejected_reason", limit: 65535
      t.string   "document_image_before"
      t.integer  "document_image_admin_user_id"
      t.index ["user_id"], name: "index_user_age_certifications_on_user_id", using: :btree
    end
  end
end
