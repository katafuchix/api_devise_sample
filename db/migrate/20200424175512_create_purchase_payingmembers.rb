class CreatePurchasePayingmembers < ActiveRecord::Migration[6.0]
  def change
    create_table "purchase_payingmembers", force: :cascade do |t|
      t.string   "product_id_str"
      t.string   "name"
      t.integer  "price"
      t.integer  "term"
      t.boolean  "is_premium"
      t.integer  "sort_order"
      t.datetime "created_at",     null: false
      t.datetime "updated_at",     null: false
      t.index ["product_id_str"], name: "index_purchase_payingmembers_on_product_id_str", using: :btree
    end
  end
end
