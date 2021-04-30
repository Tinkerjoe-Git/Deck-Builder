class Card < ApplicationRecord
  belongs_to :deck, optional: true
  belongs_to :decklist, optional: true
  has_many :decklists
  has_many :decks, through: :decklists

  validates :name, presence: true
  

  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }
end
