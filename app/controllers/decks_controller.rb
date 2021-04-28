class DecksController < ApplicationController

    def new
        @deck = Deck.new
        #@deck = @decklist.quantities.build

    end

    def edit
        @deck = Deck.find(params[:id])
    end

    def create
        #@deck = Deck.new(deck_params)
        @deck = @decklist.quantities.build(user_id: current_user.id, contents: current_user.decklist.quantities)

        if @deck.save
            redirect_to deck_path(@deck)
        else
            render :new
            flash[:error] = "Decklist couldn't compile, Please try again."
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

    def find_decklist
        @decklist = Decklist.find_by_id(params[:decklist_id])
    end

end
