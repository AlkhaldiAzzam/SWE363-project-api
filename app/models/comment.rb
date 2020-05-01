class Comment < ApplicationRecord
  belongs_to :question

  validates_presence_of :content
end
