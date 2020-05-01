class User < ApplicationRecord
    # encrypt password
    has_secure_password
  
   has_many :questions, foreign_key: :created_by, primary_key: :first_name

    # Validations
    validates_presence_of :first_name, :email, :password_digest
    validates :email, uniqueness: true
  end