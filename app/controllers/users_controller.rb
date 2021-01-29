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

        if @user.valid?
            
            @user.user_association
            @user.save
            session[:username] = @user.username
            redirect_to edit_user_path(@user)
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_personal_params)
        redirect_to user_path(@user)
    end

    def welcome
        @user = User.find_by(username: session[:username])
        @user.update(user_personal_params)
    end

    def orders
        
        @user = User.find_by(username: session[:username])
        @user_orders = Alteration.all.select do |alteration|
            @user.client.id == alteration.client_id
        end
    end
    

    private

    def user_username_params
        params.require(:user).permit(:username, :password, :password_confirmation, :usable_type, :usable_id)
    end

    def user_personal_params
        params.require(:user).permit(:name, :street, :city, :state, :zip_code)
    end


end