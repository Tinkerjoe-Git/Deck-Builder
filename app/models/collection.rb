class Collection < ApplicationRecord
    belongs_to :user
    belongs_to :card
    #validates :count, presence: true
end
