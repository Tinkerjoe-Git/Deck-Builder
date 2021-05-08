class CollectionsController < ApplicationController


  def new
    if params[:card_id]
      @cards = Cards.find_by(params[:card_id])
      @collection = @cards.collections.build
    else
      @collection = Collection.new
    end
      
  end

  # def edit
  #   @collection = Collection.find(params[:id]
  # end

  def show
    collection = Collection.find(params[:id])
  end


  def create 
    if params[:card_id]
      @cards = Card.find_by(params[:card_id])
      @collection = @cards.collections.build(collection_params)
    else 
      @collection = Collection.new(collection_params)
    end 

    if @collection.save 
      redirect_to collection_path(@collection)
    else 
      render :new
    end 
  end 
  # def create
  #   @collage = Collage.new(collage_params)

  #   if @collage.save
  #     redirect_to collage_path(@collage)
  #   else
  #     render :new
  #   end
  # end

  private

  def collection_params
    params.require(:collection).permit(:count, :collection_id, card_attributes: [:name, :text, :power, :toughness, :cmc, :card_type, :colors, :set, :mana_cost, :image_url])
  end
end




