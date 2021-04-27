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
        
        @card = card.new(card_params)
        if @card.save
            render :new
        else
            flash[:error] = "Could not create card"
        end
    end

    def edit
        @card = card.find_by(id: params[:id] )
        render :edit
    end

    def update
        @card = card.find_by(id: params[:id])
        @card.update(card_params)

        if @card.valid?
            redirect_to card_path(@card)
        else
            render :edit
        end
    end



    def destroy
        ## I don't think we want anyone but admin to do this, and even then why.
        @card = card.find_by(id: params[:id])
        @card.destroy
        redirect_to cards_path
    end

    private
    #Strong Params
    def card_params
        params.require(:card).permit(:name, :text, :power, :toughness, :cmc, :card_type, :colors, :set, :mana_cost, :image_url)
    end
end
