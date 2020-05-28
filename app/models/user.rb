class User < ApplicationRecord
    has_many :stories
    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :username, uniqueness: {message: "Try a different %{attribute}. %{value} has already been taken."}
end
