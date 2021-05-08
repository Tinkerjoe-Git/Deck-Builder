class Card < ApplicationRecord
  # belongs_to :deck, optional: true
  belongs_to :collection, optional: true
  belongs_to :user, optional: true
  has_many :deck_cards
  has_many :decks, through: :deck_cards

  validates :name, presence: true
  

  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }


  def collection_attributes=(attributes)
    self.collection = collection.find_or_create_by(attributes)
  end

  




  private

  def card_params
    params.require(:card).permit(:name, :text, :power, :toughness, :cmc, :rarity, :card_type, :artist, :colors, :set, :flavor, :mana_cost, :image_url, :loyalty, :number, :multiverse_id, :magic_set_id)
  end
end
