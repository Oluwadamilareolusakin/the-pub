class Add < ActiveRecord::Migration[6.0]
  def change
    add_index :friend_requests, [:requested_id, :requester_id], unique: true
  end
end
