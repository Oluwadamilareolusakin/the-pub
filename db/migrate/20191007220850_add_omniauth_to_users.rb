class AddOmniauthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provide, :string
    add_column :users, :uid, :string
  end
end
