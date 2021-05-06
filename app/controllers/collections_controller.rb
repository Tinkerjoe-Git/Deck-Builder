class CollectionsController < ApplicationController
  def show
    collection = Collection.find_by(user: current_user, card: find_by_card_id)
    render: collection
  end

  def update
    if logged_in? 
      if params["id"] == ""
        collection = Collection.create(card: find_by_card_id, user: current_user)
        render: collection, status: 201
      else
        collection = Collection.find_by(card: find_by_card_id, user: current_user)
        collection.delete
        render: collection, status: 201
      end
    else 
      flash["alert"] = "Please login to collect cards"
      redirect_back(fallback_location: root_path)
    end
  end

end
