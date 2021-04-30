class Card < ApplicationRecord
  belongs_to :deck, optional: true
  has_many :deck_cards
  has_many :decks, through: :deck_cards

  validates :name, presence: true
  

  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }

  def deck_attributes=(attributes)
    
    if !(attributes[:name].blank?
        self.deck = Deck.find_or_create_by(attributes)
    end
  end

  private

  def card_params
    params.require(:card).permit(:name, :text, :power, :toughness, :cmc, :rarity, :card_type, :artist, :colors, :set, :flavor, :mana_cost, :image_url, :loyalty, :number, :multiverse_id, :magic_set_id)
  end
end
