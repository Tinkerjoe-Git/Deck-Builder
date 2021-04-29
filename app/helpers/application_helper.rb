module ApplicationHelper
    
    def current_user
        @user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def find_by_user_id
        User.find_by(id: params[:user_id])
    end

    def find_by_deck_id
        Recipe.find_by(id: params[:deck_id])
    end

    
end
