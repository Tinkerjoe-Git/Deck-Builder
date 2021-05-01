class Card < ApplicationRecord
  # belongs_to :deck, optional: true
  has_many :deck_cards
  has_many :decks, through: :deck_cards

  validates :name, presence: true
  

  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }


  def self.sort_by_colors(colors)
    @cards = Card.all
    @cards.sort_by { |c| c.colors }
  end




  private

  def card_params
    params.require(:card).permit(:name, :text, :power, :toughness, :cmc, :rarity, :card_type, :artist, :colors, :set, :flavor, :mana_cost, :image_url, :loyalty, :number, :multiverse_id, :magic_set_id)
  end
end
