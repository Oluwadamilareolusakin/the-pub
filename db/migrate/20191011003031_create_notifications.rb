class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :notifyable_id, null: false
      t.string :notifyable_type, null: false
      t.string :message, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
