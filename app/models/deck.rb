class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards
  has_many :cards, through: :decklists
  ####Scope out our breakdown.

  validates :name, presence: true

end
