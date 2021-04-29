class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :format
  has_many :deck_cards, dependent: :delete_all
  has_many :cards, through: :deck_cards
  validates :name, :format, presence: true


  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }


