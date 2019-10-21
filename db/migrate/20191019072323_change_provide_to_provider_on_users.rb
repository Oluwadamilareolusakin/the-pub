class ChangeProvideToProviderOnUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :provide
    add_column :users, :provider, :string
  end
end
