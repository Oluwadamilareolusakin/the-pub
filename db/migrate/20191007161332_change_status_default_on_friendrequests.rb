class ChangeStatusDefaultOnFriendrequests < ActiveRecord::Migration[6.0]
  def change
    change_column :friend_requests, :status, :integer, default: 0
  end
end
