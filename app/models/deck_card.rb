class DeckCard < ApplicationRecord
  belongs_to :deck
  belongs_to :card
  validates :card_id, :deck_id, presence: true

  # TODO: What is this method? Do we need it?
  def unique_deck_card
    !DeckCard.find_by(card_id: self.card_id, deck_id: self.deck_id, sideboard: self.sideboard)
  end
end
