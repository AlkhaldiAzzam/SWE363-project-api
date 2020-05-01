class AddDefaultValueToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :user_type, :string, :default => "Normal User"
  end
end
