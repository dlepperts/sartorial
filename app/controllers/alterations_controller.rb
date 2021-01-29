class AlterationsController < ApplicationController
  before_action :set_alteration, only: %i[ show edit update destroy ]

  def show
    @alteration = Alteration.find(params[:id])
    @user = User.find_by(username: session[:username])
  end

  def index

  end

  def new
    @alteration = Alteration.new
    @user = User.find_by(username: session[:username])
    @tailors = Tailor.all_tailors
  end

  def edit
    @alteration = Alteration.find(params[:id])
    @tailors = Tailor.all.map do |tailor|
      tailor.user
    end
  end
  
  def create
    
    @item_types = ItemType.all
    @alteration = Alteration.new(alteration_params)
    if @alteration.save
    redirect_to alteration_path(@alteration)
    else
      render :new
    end
  end

  def update
    @tailors = Tailor.all.map do |tailor|
      tailor.user
    end
    @alteration = Alteration.find(params[:id])
    @alteration.update(alteration_params)
    redirect_to alteration_path(@alteration)
  end

  def destroy
    @alteration.destroy
    respond_to do |format|
      format.html { redirect_to alterations_url, notice: "Alteration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    
    def set_alteration
      @alteration = Alteration.find(params[:id])
    end

    def alteration_params
      params.require(:alteration).permit(:item_type_id, :client_id, :tailor_id, :date, :comments)
    end
end
