class CreateUserBlockedPhones < ActiveRecord::Migration[6.0]
  def change
    create_table :user_blocked_phones do |t|
      t.integer :user_id
      t.string :phone_number

      t.timestamps
    end
    add_index :user_blocked_phones, :user_id

    add_column :user_blocks, :is_forced, :boolean, default: false, null: false
  end
end
