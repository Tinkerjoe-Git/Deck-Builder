class Collection < ApplicationRecord
    belongs_to :user, optional: true
    has_many :cards
    #validates :count, presence: true
    accepts_nested_attributes_for :cards
end
