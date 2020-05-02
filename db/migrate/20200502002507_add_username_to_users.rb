class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    drop_table :news
  end
end
