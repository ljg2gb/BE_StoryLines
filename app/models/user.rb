class User < ApplicationRecord
    has_many :stories
    has_secure_password
    validates :first_name, :last_name, :username, :email, :password, presence: true
    validates :username, uniqueness: {message: "Try a different %{attribute}. %{value} has already been taken."}
end
