class TailorsController < ApplicationController
  before_action :set_tailor, only: %i[ show edit update destroy ]

  #CRUD
  def index
    @tailors = Tailor.all
    @featured_tailor = Tailor.featured_tailor
    
  end

  def show
    @tailor = Tailor.find_tailor(params)
  end

  def new
    @tailor = Tailor.new
  end

  def edit
  end

  def create
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
  end

  #Other Pages
  def reviews
    @tailor = User.find(params[:id])
    @reviews = Review.all.select do |review|
      review.tailor_id == @tailor.id
    end
    if @reviews.count == 0 
      "No Reviews Yet!"
    else
      @reviews
    end
  end

  def alterations
    @tailor = User.find(params[:id])
    @alterations = Alteration.all.select do |alteration|
      alteration.tailor == @tailor
    end
  end

  private
    def set_tailor
      @tailor = User.find(params[:id])
    end

    def tailor_params
      params.require(:tailor).permit(:name, :bio, :street, :city, :state, :zip_code)
    end
end
