class CreateUserMatchMessages < ActiveRecord::Migration[6.0]
  def change
    create_table "user_match_messages", force: :cascade　 do |t|
      t.integer  "user_match_id"
      t.string   "message"
      t.datetime "created_at",                           null: false
      t.datetime "updated_at",                           null: false
      t.string   "image"
      t.integer  "sender_user_id",                       null: false
      t.integer  "receiver_user_id",                     null: false
      t.integer  "message_status",       default: 0
      t.datetime "message_confirmed_at"
      t.string   "message_was_accepted"
      t.string   "message_was_rejected"
      t.boolean  "delivered",            default: false, null: false
      t.index ["user_match_id"], name: "index_user_match_messages_on_user_match_id", using: :btree
    end
  end
end
