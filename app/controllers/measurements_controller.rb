class MeasurementsController < ApplicationController
  before_action :set_measurement, only: %i[ show edit update destroy ]


  def show
  end

  def new
    @measurement = Measurement.new
  end

  def edit
  end

  def create
    @measurement = Measurement.new(measurement_params)

  end

  def update
    @measurement = Measurement.find(params[:id])
    if @measurement.update(measurement_params)
      redirect_to client_path(@measurement.client_id)
    else
      render :edit
    end
  end


  def destroy
    @measurement.destroy
    respond_to do |format|
      format.html { redirect_to measurements_url, notice: "Measurement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    def measurement_params
      params.require(:measurement).permit(:waist, :chest_bust, :hips, :rise, :neck)
    end
end
