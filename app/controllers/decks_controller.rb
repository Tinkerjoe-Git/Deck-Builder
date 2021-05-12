class DecksController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]

    def new
        @deck = Deck.new
    end

    def index
        @decks = Deck.all
    end

    def search
        @decks = Deck.search(params[:name])
        render :index
    end

    def edit
        @deck = Deck.find(params[:id])
    end

    def create
        @deck = current_user.decks.create!(name: deck_params[:name])
        
        deck_params[:card_ids].map do |card_id|
            
            DeckCard.create!(
                deck_id: @deck.id,
                card_id: card_id,
                quantity: deck_params[:quantity][card_id.to_i-1]
            )
    
        end

        redirect_to deck_path(@deck)
    end


    def index
        @decks = Deck.all
    end

    def show
        @deck = Deck.find(params[:id])
    end

    def update
        @deck = Deck.find_by(id: params[:id])
        @original_deck_cards = @deck.deck_cards
        @new_deck_cards = params[:cards]
        @cids_to_destroy = @original_deck_cards.collect{|c| c[:id]} - @new_deck_cards.collect{|c| c[:id]}.compact
        @deck_cards_to_add = @new_deck_cards.select{ |c| c[:id] == nil }
        if @cids_to_destroy.length > 0
            DeckCard.where(id: cids_to_destroy).destroy_all
        end

        @new_deck_cards.each do |c|
            @deck_card = DeckCard.new(
                    deck_id: params[:id],
                    card_id: Card.find_by(name: c[:name]).id,
                    quantity: deck_params[:quantity][card_id.to_i-1]
                )
                @deck_card.save
        end
        @deck.save
        redirect_to deck_path(@deck)
    end

    def destroy
        @deck = Deck.find_by(id: params[:id])
        @deck.destroy
        redirect_to decks_path
    end



    private

    def deck_params
        params.require(:deck).permit(:name, card_ids: [], quantity: [])
    end

    def card_params
        params.require(:card).permit(:name, :text, :power, :toughness, :cmc, :rarity, :card_type, :artist, :colors, :set, :flavor, :mana_cost, :image_url, :loyalty, :number, :multiverse_id, :magic_set_id, :quantity)
    end

    def deck_card_params
        params.require(:deck).permit(deck_cards_attributes: [:deck_id, :card_id, :quantity, card: [:name]])
    end

    def find_deck_card
        @deck_card = DeckCard.find_by(deck_id: params[:deck_id])
    end
end

