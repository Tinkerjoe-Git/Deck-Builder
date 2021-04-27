class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards
  has_many :comments ##reseed?
  has_many :users, through: :comments
  ####Scope out our breakdown.

  validates :name, presence: true

end
