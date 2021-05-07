class CardsController < ApplicationController
    before_action :find_collection, only: [:index, :new, :create]

    def search
        @cards = Card.search(params[:name])
        render :index
    end


    def index
        @cards = Card.all
    end
    
    def show
        @card = Card.find(params[:id])
    end
    
    def new
        if @collection
            @cards = @collection.cards.build
        else
            @cards = Card.new
        end
    end

    def create
    end

    def edit
    end

    def update
    end



    def destroy
    end

    private
    #Strong Params
    def card_params
        params.require(:card).permit(:name, :text, :power, :toughness, :cmc, :card_type, :colors, :set, :mana_cost, :image_url, collection_attributes: [:count])
    end

    def find_collection
        @collection = Collection.find_by_id(params[:collection_id])
    end

end
