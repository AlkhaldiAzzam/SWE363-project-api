class RemoveContentFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :content, :string
    
  end
end
