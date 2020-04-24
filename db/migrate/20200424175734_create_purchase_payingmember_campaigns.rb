class CreatePurchasePayingmemberCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table "purchase_payingmember_campaigns", force: :cascade do |t|
      t.integer  "purchase_payingmember_id"
      t.integer  "campaign_type"
      t.integer  "sex"
      t.integer  "value"
      t.datetime "start_at"
      t.datetime "end_at"
      t.boolean  "enabled",                  default: true
      t.datetime "created_at",                              null: false
      t.datetime "updated_at",                              null: false
      t.string   "name"
      t.integer  "sort_order"
      t.integer  "contact_type",             default: 0
      t.index ["purchase_payingmember_id"], name: "purchase_payingmember_campaigns_idx", using: :btree
    end
  end
end
