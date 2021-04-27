class Card < ApplicationRecord
  belongs_to :deck, optional: true
  has_many :decklists
  has_many :decks, through: :decklists

  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }
end
