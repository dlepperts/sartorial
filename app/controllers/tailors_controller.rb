class TailorsController < ApplicationController
  before_action :set_tailor, only: %i[ show edit update destroy ]

  # GET /tailors or /tailors.json
  def index
    @tailors = Tailor.all
  end

  # GET /tailors/1 or /tailors/1.json
  def show
  end

  # GET /tailors/new
  def new
    @tailor = Tailor.new
  end

  # GET /tailors/1/edit
  def edit
  end

  # POST /tailors or /tailors.json
  def create
    @tailor = Tailor.new(tailor_params)

    respond_to do |format|
      if @tailor.save
        format.html { redirect_to @tailor, notice: "Tailor was successfully created." }
        format.json { render :show, status: :created, location: @tailor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tailor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tailors/1 or /tailors/1.json
  def update
    respond_to do |format|
      if @tailor.update(tailor_params)
        format.html { redirect_to @tailor, notice: "Tailor was successfully updated." }
        format.json { render :show, status: :ok, location: @tailor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tailor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tailors/1 or /tailors/1.json
  def destroy
    @tailor.destroy
    respond_to do |format|
      format.html { redirect_to tailors_url, notice: "Tailor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tailor
      @tailor = Tailor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tailor_params
      params.fetch(:tailor, {})
    end
end
