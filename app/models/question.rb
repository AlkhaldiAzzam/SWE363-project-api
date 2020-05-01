class Question < ApplicationRecord

    # belongs_to :user, :foreign_key, :first_name
    has_many :comments, dependent: :destroy
    # belongs_to :user, dependent: :destroy
    validates_presence_of :title, :created_by

end
