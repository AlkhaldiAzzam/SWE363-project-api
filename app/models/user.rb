class User < ApplicationRecord
    # encrypt password
    has_secure_password
  
   has_many :questions, foreign_key: :created_by, primary_key: :username

    # Validations
    validates_presence_of :username, :email, :password_digest
    validates :email, :username, uniqueness: true
  end