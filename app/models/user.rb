class User < ApplicationRecord
    has_secure_password

    has_many :created_decks, foreign_key: "user_id", class_name: "Deck"

    has_many :decks, through: :cards
    has_many :comments

end
