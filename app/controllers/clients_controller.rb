class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]

  def index
    @clients = Client.all
  end
  
  def show
  end
  
  def new
    @client = Client.new
    @client.measurements.build(waist: "Waist", chest_bust: "Chest/Bust", hips: "Hips", rise: "Rise", neck: "Neck")
  end
  
  def edit
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to client_path(@client)
    else
      render :new
    end
  end
  
  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to client_path(@client)
    else
      @client.reload
      render :edit
    end
  end
  
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    
    def set_client
      @client = User.find(params[:id])
    end
    
    def client_params
      params.require(:client).permit(:name, :street, :city, :state, :zip_code, measurements_attributes: [ :waist, :chest_bust, :hips, :rise, :neck ])
    end
end
