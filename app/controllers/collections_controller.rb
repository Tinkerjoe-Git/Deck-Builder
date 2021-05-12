class CollectionsController < ApplicationController


  def new
    @collection = Collection.new
    3.times { @collection.cards.build } 
  end

  def edit
    @collection = Collection.find(params[:id]
  end

  def show
    collection = Collection.find(params[:id])
  end

  def create
    @collage = Collage.new(collage_params)

    if @collage.save
      redirect_to collage_path(@collage)
    else
      render :new
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:name, card_attributes: [:name, :text, :power, :toughness, :cmc, :card_type, :colors, :set, :mana_cost, :image_url])
  end
end




