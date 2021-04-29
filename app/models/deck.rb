class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards
  has_many :decklists
  has_many :cards, through: :decklists
  ####Scope out our breakdown.

  validates :name, presence: true

  accepts_nested_attributes_for :cards, reject_if: lambda {|attributes| attributes['name'].blank?}
  accepts_nested_attributes_for :decklists, reject_if: lambda {|attributes| attributes['quantities'].blank?}

  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }

  include ActionView::Helpers::TextHelper



  def add_decklist_to_deck(params)

    #delete_decklist_from_decklist
    
    params[:decklist_attributes].each do |decklist|

      if decklist[:quantities].present?
        card_name = decklist[:quantities][:name].downcase
        card = Card.find_by(name: card_name)
      elsif decklist[:card_id].present?
        card = Card.find_by(id: decklist[:card_id])
      end

      if decklist[:quantities].present?
        Decklist.create(quantities: decklist[:quantities], card_id: card.id, deck_id: self.id )
      end

    end

  end
end
