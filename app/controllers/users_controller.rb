class UsersController < ApplicationController

    # skip_before_action :authorized, only: [:new, :create]

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_username_params)
        @user.save
        session[:username] = @user.username
        redirect_to '/welcome'
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_personal_params)
    end

    def welcome
        
        @user = User.find_by(username: session[:username])
    end

    private

    def user_username_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def user_personal_params
        params.require(:user).permit(:name, :street, :city, :state, :zip_code, :tailor)
    end

end