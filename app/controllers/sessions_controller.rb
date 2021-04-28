class SessionsController < ApplicationController
  def new
  end

  def create
    return redirect_to '/login' if !params[:email] || params[:email].empty?
    user = User.find_by(email: params[:email])
    user = user.try(:authenticate, params[:password])
    return redirect_to '/login' unless user
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def destroy
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
      
      if @user.valid?
          flash[:messsage] = "You've signed in with Google!"
          session[:user_id] = @user.id
          redirect_to cards_path
      else
          flash[:message] = "Credentials didn't go through"
          redirect_to login_path
      end
  end

  private
  def auth
      request.env['omniauth.auth']
  end

end