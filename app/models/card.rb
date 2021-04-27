class Card < ApplicationRecord
  belongs_to :deck, optional: true

  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }
end
