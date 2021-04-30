class Deck < ApplicationRecord
  belongs_to :user
  has_many :deck_cards
  has_many :cards, through: :deck_cards
  validates :name, :format, presence: true

  accepts_nested_attributes_for :deck_cards    
  accepts_nested_attributes_for :cards

  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }

  def delete_cards_from_deck
      cards.size.times do
      card = DeckCard.find_by(deck_id: self.id)
      card.delete
    end
  end


  def add_cards_to_deck(params)

    delete_cards_from_deck
    
    params[:deck_cards_attributes].each do |k, deck_card|

      if deck_card[:card][:name].present?
        card_name = deck_card[:card][:name].downcase
        card = card.find_by(name: card_name)
      elsif deck_card[:card_id].present?
        card = card.find_by(id: deck_card[:card_id])
      end

      if deck_card[:card_count].present?
        DeckCard.create(card_count: deck_card[:card_count], card_id: card.id, deck_id: self.id )
      end
    end
  end
end