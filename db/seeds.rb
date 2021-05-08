require 'mtg_sdk'
require 'faker'




User.create_admin

card_data = MTG::Card.where(set: 'khm').all
    

    card_data.each do |data|
        puts 'generating card data...'
        cards = Card.create(
            name: data.name,
            text: data.text,
            power: data.power.to_i,
            toughness: data.toughness.to_i,
            cmc: data.cmc.to_i,
            rarity: data.rarity,
            artist: data.artist,
            flavor: data.flavor,
            loyalty: data.loyalty.to_i,
            number: data.number.to_i,
            multiverse_id: data.multiverse_id.to_i,
            image_url: data.image_url,
            colors: data.colors.to_s,
            set: data.set,
            card_type: data.type,
            mana_cost: data.mana_cost.to_s,
            collection_id: 1
        )
        cards.save
        puts "#{cards.name} generated"
    end

# formats = ['Standard', 'Modern', 'Legacy', 'Vintage', 'Historic', 'Pioneer']

# puts "Grabbing sets"

# set_data = MTG::Set.all

#      set_data.each do |data|
#         puts 'generating set data...'
#         sets = MagicSet.create(
#             name: data.name,
#             code: data.code,
#             release_date: data.release_date
#         )
#         sets.save
#         puts "#{sets.name} generated"
#      end






    




