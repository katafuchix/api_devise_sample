class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    #create_table :articles do |t|
    create_table :articles, force: :cascade do |t|
      t.string :body
      #t.references :user, null: false, foreign_key: true
      t.integer  :user_id
      t.datetime :created_at,                                               null: false
      t.datetime :updated_at,                                               null: false
      t.datetime :deleted_at
    end
    add_index :articles, :user_id, using: :btree
    add_index :articles, :deleted_at, using: :btree
  end
end
