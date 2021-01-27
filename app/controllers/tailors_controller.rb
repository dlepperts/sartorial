class TailorsController < ApplicationController
  before_action :set_tailor, only: %i[ show edit update destroy ]

  def index
    @tailors = Tailor.all
  end

  def show
    @tailor = Tailor.find(params[:id])
  end

  def new
    @tailor = Tailor.new
  end

  def edit
  end

  def reviews
    @tailor = Tailor.find(params[:id])
    @reviews = Review.all.select do |review|
      review.tailor_id == @tailor.id
    end
    
  end

  def create
    byebug
    @tailor = Tailor.new(tailor_params)
    if @tailor.save
      redirect_to tailor_path(@tailor)
    else
      render :new
    end
  end

  def update
  
  end

  def destroy
    @tailor.destroy
    respond_to do |format|
      format.html { redirect_to tailors_url, notice: "Tailor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_tailor
      @tailor = Tailor.find(params[:id])
    end

    def tailor_params
      params.require(:tailor).permit(:name, :bio, :street, :city, :state, :zip_code)
    end
end
