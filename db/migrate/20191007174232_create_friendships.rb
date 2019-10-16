class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :friend_id

      t.timestamps
    end

    add_index :friendships, :friend_id
    add_index :friendships, [:friend_id, :user_id], unique: true
  end
end
