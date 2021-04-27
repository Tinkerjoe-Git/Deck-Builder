class DecksController < ApplicationController

    def new
        @deck = Deck.new
    end

    def edit
        @deck = Deck.find(params[:id])
    end

    def create
        @deck = Deck.new(deck_params)

        if @deck.save
            redirect_to deck_path(@deck)
        else
            render :new
        end
    end

    def index
        @decks = Deck.all
    end

    def show
        @deck = Deck.find(params[:id])
    end

    private

    def deck_params
        params.require(:deck).permit(:name, :decklist, :user_id)
    end

end
