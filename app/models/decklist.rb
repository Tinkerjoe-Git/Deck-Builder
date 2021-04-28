class Decklist < ApplicationRecord
    has_many :cards

    
    
    
    
    
    validates :card_id, presence: true
    #accepts_nested_attributes_for :cards, reject_if: proc { |attributes| attributes[''].blank? || attributes[''].blank? || attributes[''].blank? }
end
