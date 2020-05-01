class AddContentToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :content, :text
  end
end
