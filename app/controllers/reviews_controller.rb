class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
    @client = User.find_by(username: session[:username])
    @tailors = Tailor.all.map do |tailor|
      tailor.user
    end
  end

  def edit
  end

  def create
    @tailors = Tailor.all.map do |tailor|
      tailor.user
    end
    @client = User.find_by(username: session[:username])
    @review = Review.new(review_params)
    byebug
    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  def update

  end

  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:client_id, :tailor_id, :rating, :review)
    end
end
