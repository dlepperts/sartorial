class AlterationsController < ApplicationController
  before_action :set_alteration, only: %i[ show edit update destroy ]

  # GET /alterations or /alterations.json
  def index
    @alterations = Alteration.all
  end

  # GET /alterations/1 or /alterations/1.json
  def show
  end

  # GET /alterations/new
  def new
    @alteration = Alteration.new
  end

  # GET /alterations/1/edit
  def edit
  end

  # POST /alterations or /alterations.json
  def create
    @alteration = Alteration.new(alteration_params)

    respond_to do |format|
      if @alteration.save
        format.html { redirect_to @alteration, notice: "Alteration was successfully created." }
        format.json { render :show, status: :created, location: @alteration }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @alteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alterations/1 or /alterations/1.json
  def update
    respond_to do |format|
      if @alteration.update(alteration_params)
        format.html { redirect_to @alteration, notice: "Alteration was successfully updated." }
        format.json { render :show, status: :ok, location: @alteration }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alteration.errors, status: :unprocessable_entity }
      end
    end
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
      params.fetch(:alteration, {})
    end
end
