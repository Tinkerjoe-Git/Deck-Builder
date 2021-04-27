class User < ApplicationRecord
    has_secure_password
    has_many :cards, through: :decks
    has_many :created_decks, foreign_key: "user_id", class_name: "Deck"
    has_many :decks, through: :cards, foreign_key: "user_id", class_name: "Deck"
    

end
