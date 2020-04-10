class CreateUserPayments < ActiveRecord::Migration[6.0]
  def change
    create_table "user_payments", force: :cascade do |t|
      t.integer  "user_id"
      t.datetime "start_at"
      t.datetime "end_at"
      t.integer  "payment_type"
      t.boolean  "enabled",            default: true
      t.datetime "next_term_start_at"
      t.datetime "created_at",                        null: false
      t.datetime "updated_at",                        null: false
      t.index ["enabled"], name: "index_user_payments_on_enabled", using: :btree
      t.index ["next_term_start_at"], name: "index_user_payments_on_next_term_start_at", using: :btree
      t.index ["payment_type"], name: "index_user_payments_on_payment_type", using: :btree
      t.index ["user_id"], name: "index_user_payments_on_user_id", using: :btree
    end
  end
end
