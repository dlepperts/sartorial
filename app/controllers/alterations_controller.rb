class AlterationsController < ApplicationController
  before_action :set_alteration, only: %i[ show edit update destroy ]


  # GET /alterations/1 or /alterations/1.json
  def show
    @alteration = Alteration.find(params[:id])
  end

  # GET /alterations/new
  def new
    @alteration = Alteration.new
  end

  # GET /alterations/1/edit
  def edit
    @alteration = Alteration.find(params[:id])
  end

  # POST /alterations or /alterations.json
  def create
    @alteration = Alteration.new(alteration_params)
    @alteration.save
    redirect_to alteration_path(@alteration)
  end

  # PATCH/PUT /alterations/1 or /alterations/1.json
  def update
    @alteration = Alteration.find(params[:id])
    @alteration.update(alteration_params)
    redirect_to alteration_path(@alteration)
  end

  # DELETE /alterations/1 or /alterations/1.json
  def destroy
    @alteration.destroy
    respond_to do |format|
      format.html { redirect_to alterations_url, notice: "Alteration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alteration
      @alteration = Alteration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alteration_params
      params.require(:alteration).permit(:item_type_id, :client_id, :tailor_id)
    end
end
