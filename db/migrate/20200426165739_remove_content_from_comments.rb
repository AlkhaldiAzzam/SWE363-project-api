class RemoveContentFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :content, :string

  end
end
