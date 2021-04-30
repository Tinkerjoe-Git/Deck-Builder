class Card < ApplicationRecord
  belongs_to :deck, optional: true
  belongs_to :decklist, optional: true
  has_many :decklists
  has_many :decks, through: :decklists

  validates :name, presence: true
  

  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }

  private

  def card_params
    params.require(:card).permit(:name, :text, :power, :toughness, :cmc, :rarity, :card_type, :artist, :colors, :set, :flavor, :mana_cost, :image_url, :loyalty, :number, :multiverse_id, :magic_set_id)
  end
end
