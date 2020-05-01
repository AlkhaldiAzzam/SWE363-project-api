class RemovingContentsAgain < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :contents, :string
  end
end
