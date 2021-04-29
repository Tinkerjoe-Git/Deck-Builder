## Todo

- Fix pathing, and finish out views for Deck submission and Decklist.


class DecklistsController < ApplicationController
    def new
        @decklist = Decklist.new
    end

    def edit
        @decklist = Decklist.find(params[:id])
    end

    def create
        @deck = Deck.find_by_id(params[:deck_id])
        @decklist = @deck.decklist.build(decklist_params)
        

        if @decklist.save
            flash[:notice] = "Your deck was successfully created"
            redirect_to deck_path(@deck)
        else
            flash[:notice] = "Your deck was NOT successfully created"
            redirect_to deck_path(@deck)
        end
    end

    def index
        @decklists = Decklist.all
    end

    def show
        @decklist = Decklist.find(params[:id])
        @decks = @decklist.quantities
        @deck = @decklist.quantities.build(user_id: current_user.id)
    end

    private

    def decklist_params
        params.require(:decklist).permit(:card_id, :user_id, :quantities) # deck_attributes: [:name, :decklist, :user_id])
    end

    def find_deck
        @deck = Deck.find_by_id(params[:deck_id])
    end
end

