class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :params_planet, only: [:update, :create]
  before_action :set_planet, only: [:delete, :show, :edit]

  def index
    @planets = Planet.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(params_planet)
    @planet.user = current_user
    if @planet.save!
      redirect_to planet_path(@planet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @planet.update(params_planet)
    redirect_to planet_path(@planet)
  end

  def delete
    @planet.destroy
    redirect_to planets_path
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def params_planet
    params.require(:planet).permit(:name, :planet_type, :summary, :inhabitants,
                                   :available_places, :location, :catch_phrase,
                                   :price, photos: [])
  end
end
