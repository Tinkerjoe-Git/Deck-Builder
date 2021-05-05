class CardsController < ApplicationController
    #before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]

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
        params.require(:card).permit(:name, :text, :power, :toughness, :cmc, :card_type, :colors, :set, :mana_cost, :image_url)
    end

end
