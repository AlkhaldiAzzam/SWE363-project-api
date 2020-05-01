class AddFieldsToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :contents, :string
  end
end
