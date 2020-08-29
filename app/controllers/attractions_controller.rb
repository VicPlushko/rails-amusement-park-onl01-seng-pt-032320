class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:create, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    if @attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :new, :alert => "Please fill in all fields."
    end
  end

  def show
    @ride = Ride.new
  end

  def edit
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction), :alert => "Successfully Updated Attraction"
    else
      render :edit, :alert => "All fields required"
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end
end
