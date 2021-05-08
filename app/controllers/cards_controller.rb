class CardsController < ApplicationController
    before_action :find_collection, only: [:index, :new, :create]

    def search
        @cards = Card.search(params[:name])
        render :index
    end


    def index
        if @collection
            @cards=@collection.cards
        else
            @cards=Card.all
        end
    end
    
    def show
        @card = Card.find(params[:id])
    end

    def new
        if @collection
            @card = @collection.cards.build
        else
            @card = Card.new
            @card.build_collection
        end

        render :new
    end

    
    # def new
    #     if params[:collection_id]
    #         @collection = Collection.find(params[:collection_id])
    #         @card = @collection.cards.build
    #     else
    #         @card.build_collection
    #     end
    # end

    def create
        @card = Card.find_by_id(params[:card_id])
        if @card.save
            if @collection
                redirect_to collection_cards_path(@collection)
            else
                redirect_to card_path(@card)
            end
        else
            render :new
        end
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
        params.require(:card).permit(:name, :text, :power, :toughness, :cmc, :card_type, :colors, :set, :mana_cost, :card_url, :collection_id, collection_attributes: [:name])
    end

    def find_collection
        @collection = Collection.find_by_id(params[:collection_id])
    end

end
