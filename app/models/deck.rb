class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :format
  has_many :deck_cards, dependent: :delete_all
  has_many :cards, through: :deck_cards
  validates :name, :format, presence: true

  accepts_nested_attributes_for :deck_cards    
  accepts_nested_attributes_for :cards

  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }


  def add_cards_to_deck(params)

    
    params[:card_attributes].each do |card|
      new_deck_card = DeckCard.new(
        deck_id: @deck.id
        card_id: card[:card_id] || Card.find_by(name: card[:name]).id
        card_count: card[:count] == '' ? 1 : card[:count],
        sideboard: card[:sideboard]
      )
      new_deck_card.save
    end
    @deck.save
  end
  

end


