class CreateUserRelations < ActiveRecord::Migration[6.0]
  def change
    
    create_table "user_relations", force: :cascade do |t|
      t.integer  "user_id"
      t.integer  "target_user_id",                               null: false
      t.text     "comment",        limit: 65535
      t.boolean  "read",                         default: false
      t.integer  "user_match_id"
      t.datetime "created_at",                                   null: false
      t.datetime "updated_at",                                   null: false
      t.boolean  "skipped",                      default: false
      t.index ["target_user_id"], name: "index_user_relations_on_target_user_id", using: :btree
      t.index ["user_id", "target_user_id"], name: "index_user_relations_on_user_id_and_target_user_id", unique: true, using: :btree
      t.index ["user_id"], name: "index_user_relations_on_user_id", using: :btree
      t.index ["user_match_id"], name: "index_user_relations_on_user_match_id", using: :btree
    end

  end
end
