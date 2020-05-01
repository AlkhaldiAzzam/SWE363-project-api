class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :created_by
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
