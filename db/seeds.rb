# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'mtg_sdk'

set_data = MTG::Card.where(set: 'eld').all
    

    set_data.each do |data|
        puts 'generating set data...'
        card = Card.create!(
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
        puts "#{card.name} generated"
    end


