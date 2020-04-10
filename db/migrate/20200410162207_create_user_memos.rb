class CreateUserMemos < ActiveRecord::Migration[6.0]
  def change
    create_table "user_memos", force: :cascade do |t|
      t.integer  "user_id",                     null: false
      t.integer  "target_user_id",              null: false
      t.string   "body",           limit: 1000
      t.datetime "created_at",                  null: false
      t.datetime "updated_at",                  null: false
      t.index ["target_user_id"], name: "index_user_memos_on_target_user_id", using: :btree
      t.index ["user_id", "target_user_id"], name: "index_user_memos_on_user_id_and_target_user_id", unique: true, using: :btree
      t.index ["user_id"], name: "index_user_memos_on_user_id", using: :btree
    end
  end
end
