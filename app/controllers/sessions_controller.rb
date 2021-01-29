class SessionsController < ApplicationController
    def new
    end

    def create
        @client = Client.find(params[:id])
        #session[:username] = params[:username]
        redirect_to client_path(@client)
    end

    def destroy
        session.delete :username
    end
end
