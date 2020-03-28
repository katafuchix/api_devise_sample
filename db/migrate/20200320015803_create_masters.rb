class CreateMasters < ActiveRecord::Migration[6.0]
  def change
    create_table "masters" do |t|
      t.string   "name"
      t.boolean  "enabled"
      t.integer  "sort_order"
      t.string   "type"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
