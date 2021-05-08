class Collection < ApplicationRecord
    has_many :cards
    #validates :count, presence: true
    accepts_nested_attributes_for :cards
end
