class DecklistsController < ApplicationController
    def new
        @decklist = Decklist.new
        if @decklist.valid?
            @decklist.deck.build
            @decklist.save
        end
    end

    def edit
        @decklist = Decklist.find(params[:id])
    end

    def create
        @decklist = Decklist.new(decklist_params)

        if @decklist.save
            redirect_to decklist_path(@decklist)
        else
            render :new
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
end
