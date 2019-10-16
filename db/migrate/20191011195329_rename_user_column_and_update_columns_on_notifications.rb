class RenameUserColumnAndUpdateColumnsOnNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :user_id
    add_column :notifications, :actor_id, :integer, null: false
    add_column :notifications, :receipient_id, :integer, null: false
    add_column :notifications, :read_at, :datetime, default: nil
    add_index :notifications, :actor_id
    add_index :notifications, :receipient_id
  end
end
