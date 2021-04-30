class DecksController < ApplicationController
    # before_action :find_deckcards, only: [:index, :new, :create]

    def new
        @deck = Deck.new
    end

    def index
        @decks = Deck.all
    end

    def edit
        @deck = Deck.find(params[:id])
    end

    def create
        @deck = Deck.new(deck_params)
        format_id = Format.find_by(name: params[:name]).id
        if @deck.save
            @deck.add_cards_to_deck(card_params)
            redirect_to deck_path(@deck), flash[:notice] = "Your Deck has sucessfully been added"
        else
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
        params.require(:deck).permit(:name, :creator, :format_id, :user_id, :total_cards, :mainboard, :sideboard)
    end

    def card_params
        params.require(:card).permit(:name, :text, :power, :toughness, :cmc, :rarity, :card_type, :artist, :colors, :set, :flavor, :mana_cost, :image_url, :loyalty, :number, :multiverse_id, :magic_set_id)
    end

end
