class Recipe < ApplicationRecord
    validates :title, presence: true
    validates :instruction,length: {minimum:50}
    belongs_to :user
end
