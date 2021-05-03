class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
    @user = User.new
  end

  def create
      @user = User.find_by_username(params[:user][:username])

      if @user && @user.authenticate(params[:user][:password])
          flash[:message] = "Succesful sign in"
          session[:user_id] = @user.id
          redirect_to cards_path
      else
          flash[:message] = "Invalid Credentials"
          render :new
      end
  end

  def logout
    session.delete :user_id
    redirect_to '/login'
  end

  def omniauth
      
      @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
          u.email = auth[:info][:email]
          u.username = auth[:info][:email]
          u.name = auth[:info][:name]
          u.uid = auth[:uid]
          u.provider = auth[:provider]
          u.password = SecureRandom.hex(10)
      end
      
      
      flash[:messsage] = "You've signed in with Google!"
      session[:user_id] = @user.id
      redirect_to cards_path
      # if @user.valid? == false
      #     flash[:message] = "Credentials didn't go through"
      #     redirect_to login_path
      # end
  end

  private
  def auth
      request.env['omniauth.auth']
  end

end