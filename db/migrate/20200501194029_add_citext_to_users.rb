class AddCitextToUsers < ActiveRecord::Migration[6.0]
  def change
    enable_extension :citext
    change_column :users, :first_name, :citext
  end
end
