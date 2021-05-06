class UsersController < ApplicationController


    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:message] = "Successfully signed up."
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = current_user.id
        @decks = @user.decks
        @collections = user.collections
    end

    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :email )
    end
end

