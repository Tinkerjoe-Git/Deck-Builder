class User < ApplicationRecord
    has_secure_password
    has_many :cards, through: :decks
    has_many :created_decks, foreign_key: "user_id", class_name: "Deck"
    has_many :decks, through: :cards, foreign_key: "user_id", class_name: "Deck"
    
    validates :name, presence: true
    validates :password, length: { in: 6..10}
    
    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.user_name = auth.info.name
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end

end
