class SessionsController < ApplicationController
  
  # skip_before_action :authorized, only: [:new, :create, :home, :welcome, :destroy]

    def new
    end

    def create
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
         session[:username] = @user.username
         redirect_to user_path(@user)
      else
         redirect_to '/login'
      end
   end

    def destroy
      session.delete(:username)
      redirect_to '/home'
    end


end
