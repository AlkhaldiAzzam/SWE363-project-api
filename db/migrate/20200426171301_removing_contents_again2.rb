class RemovingContentsAgain2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :contents, :string

  end
end
