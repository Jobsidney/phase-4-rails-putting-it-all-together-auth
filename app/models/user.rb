class User < ApplicationRecord
    validates :username, presence: true,uniqueness: true
    has_many :recipes, dependent: :destroy

    has_secure_password
end
