# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'mtg_sdk'
require 'faker'


4.times do
    User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        username: Faker::Internet.username,
        password: Faker::Internet.password
    )
end

User.create(name: "Pasta Batman", email: "pastabatman@gmail.com", username: "MTGbatman",  password: "password")

set_data = MTG::Card.where(set: 'eld').all
    

    set_data.each do |data|
        puts 'generating set data...'
        cards = Card.create(
            name: data.name,
            text: data.text,
            power: data.power.to_i,
            toughness: data.toughness.to_i,
            cmc: data.cmc.to_i,
            image_url: data.image_url,
            colors: data.colors.to_s,
            set: data.set,
            card_type: data.type,
            mana_cost: data.mana_cost.to_s
        )
        cards.save
        puts "#{cards.name} generated"
    end


    




