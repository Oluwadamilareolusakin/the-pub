class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
