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
        @original_deck_cards.destroy_all
        @new_deck_cards = deck_params[:card_ids]
        
        @new_deck_cards.map do |card_id|
            DeckCard.create!(
                    deck_id: @deck.id,
                    card_id: card_id,
                    quantity: deck_params[:quantity][card_id.to_i-1]
                )
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

