class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards
  has_many :users, through: :comments

  validates :name, presence: true

end
