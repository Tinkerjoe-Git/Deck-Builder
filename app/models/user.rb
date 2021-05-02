class User < ApplicationRecord
    has_many :decks
    validates :name, presence: true, uniqueness: true
    validates :password, presence: true
    has_secure_password
    
     
    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.user_name = auth.info.name
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end

    def self.create_admin
        if !self.find_by(name: 'admin')
            User.create(name: "admin", password: "1234", admin: true)
            puts "Admin account created"
        else
            puts "Admin account already exists"
        end
    end

end
