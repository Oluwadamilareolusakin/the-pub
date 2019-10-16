class RemoveMessageFromNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :message
  end
end
