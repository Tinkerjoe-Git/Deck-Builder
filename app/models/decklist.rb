class Decklist < ApplicationRecord
    belongs_to :deck
    has_many :cards, through: :deck

    
    
    
    
    
    validates :card_id, presence: true
    #accepts_nested_attributes_for :cards, reject_if: proc { |attributes| attributes[''].blank? || attributes[''].blank? || attributes[''].blank? }
end
