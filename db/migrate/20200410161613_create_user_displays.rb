class CreateUserDisplays < ActiveRecord::Migration[6.0]
  def change
    create_table "user_displays", force: :cascade do |t|
      t.integer  "user_id",        null: false
      t.integer  "target_user_id", null: false
      t.datetime "created_at",     null: false
      t.datetime "updated_at",     null: false
      t.index ["target_user_id"], name: "index_user_displays_on_target_user_id", using: :btree
      t.index ["user_id", "target_user_id"], name: "index_user_displays_on_user_id_on_target_user_id", unique: true, using: :btree
      t.index ["user_id"], name: "index_user_displays_on_user_id", using: :btree
    end
  end
end
