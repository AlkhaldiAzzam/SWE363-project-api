class AddFieldsToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :contents, :string
  end
end
