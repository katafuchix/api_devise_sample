class CreatePurchasePoints < ActiveRecord::Migration[6.0]
  def change
    create_table "purchase_points", force: :cascade do |t|
      t.string   "product_id_str"
      t.string   "name"
      t.integer  "price"
      t.integer  "point"
      t.integer  "sort_order"
      t.datetime "created_at",     null: false
      t.datetime "updated_at",     null: false
      t.index ["product_id_str"], name: "index_purchase_points_on_product_id_str", using: :btree
    end
  end
end
