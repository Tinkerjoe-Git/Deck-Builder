class DecksController < ApplicationController
    # before_action :find_decklist, only: [:index, :new, :create]

    def new
        @deck = Deck.new
        @decklist = 3.times.collect { @deck.decklists.build }
        
        # else
        #     flash[:notice] = "Couldn't find decklist"
        # end

    end

    def edit
        @deck = Deck.find(params[:id])
    end

    def create
        @deck = current_user.decks.new(deck_params)
        #@deck = @decklist.quantities.build(user_id: current_user.id, contents: current_user.decklist.quantities)

        if @deck.save
            @deck.add_decklist_to_deck(decklist_quantities_params)
            redirect_to deck_path(@deck)
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
        # @decklists = @deck.decklist
        # @decklist = @deck.decklist.build(user_id: current_user.id, decklist: @decklists.quantities)
        # @deck.update
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
        params.require(:deck).permit(:name, :decklist, :user_id, decklists_attributes: [:card_id, :user_id, :quantities])
    end

    def decklist_quantities_params
        @decklist = Decklist.find_by_id(params[:decklist_id])
    end

end
