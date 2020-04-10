class AddRelationMessageToUserRelations < ActiveRecord::Migration[5.0]
  def change
    add_column :user_relations, :active, :boolean, default: true
    rename_column :user_relations, :comment, :message
    add_column :user_relations, :message_status, :integer, null: false, default: 3
    add_column :user_relations, :message_confirmed_at, :datetime
    add_column :user_relations, :message_was_accepted, :text
    add_column :user_relations, :message_was_rejected, :text
    add_column :user_relations, :message_rejected_reason, :text
    add_column :user_relations, :message_before, :text
    add_column :user_relations, :message_admin_user_id, :integer
    add_index :user_relations, [:user_id, :active]
  end
end
