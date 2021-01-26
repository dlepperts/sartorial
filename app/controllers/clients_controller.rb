class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /clients or /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
    @client.measurements.build(waist: "Waist", chest_bust: "Chest/Bust", hips: "Hips", rise: "Rise", neck: "Neck")
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients 
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to client_path(@client)
    else
      @client.reload
      render :edit
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :sex, :street, :city, :state, :zip_code, measurements_attributes: [ :waist, :chest_bust, :hips, :rise, :neck ])
    end
end
