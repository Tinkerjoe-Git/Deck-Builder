class Collection < ApplicationRecord
    belongs_to :user
    has_many :cards
    #validates :count, presence: true
end
