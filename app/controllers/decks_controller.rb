class DecksController < ApplicationController
    # before_action :find_deckcards, only: [:index, :new, :create]
    skip_before_action :verify_authenticity_token

    def new
        @deck = Deck.new
        @cards = 4.times.collect { @deck.deck_cards.build }
    end
    

    def index
        @decks = Deck.all
    end

    def edit
        @deck = Deck.find(params[:id])
    end


    def create
        @deck = current_user.decks.new(deck_params)
        if @deck.save
            @deck.add_cards_to_deck(deck_cards_params)
            redirect_to deck_path(@deck), flash[:notice] = "Your Deck has sucessfully been added"
        else
            @deck = Deck.new
            render :new
            flash[:notice] = "Decklist couldn't compile, Please try again."
        end
    end

    def index
        @decks = Deck.all
    end

    def show
        @deck = Deck.find(params[:id])
    end

    def update
        @deck = Deck.find_by(id: params[:id])
        @deck.update(deck_params)

        if @deck.valid?
            redirect_to deck_path(@deck)
        else
            render :edit  
        end
    end



    private

    def deck_params
        params.require(:deck).permit(:name, :creator, :mainboard, :sideboard)
    end

    def card_params
        params.require(:card).permit(:name, :text, :power, :toughness, :cmc, :rarity, :card_type, :artist, :colors, :set, :flavor, :mana_cost, :image_url, :loyalty, :number, :multiverse_id, :magic_set_id)
    end

    def deck_card_params
        params.require(:deck).permit(deck_cards_attributes: [:card_count, :card_id, card: [:name]])
    end

    def find_deck_card
        @deck_card = DeckCard.find_by_id(params[:deck_card_id])
    end
end

