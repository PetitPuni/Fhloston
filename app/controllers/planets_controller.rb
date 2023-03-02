class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :params_planet, only: [:update, :create]
  before_action :set_planet, only: [:destroy, :show, :edit, :update]

  def index
    @planets = policy_scope(Planet.all)
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
      @planet = Planet.find(params[:id])

      if @planet.user != current_user
        redirect_to planet_path(@planet), notice: "You have no permission to edit this planet"
      end
  end

  def update
    @planet.update(params_planet)
    if @planet.user != current_user
      redirect_to planet_path(@planet), notice: "You don't have the permission to edit this planet"
    else
      if @planet.update(params_planet)
        redirect_to planet_path(@planet)
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @planet.photo.purge
    @planet.delete
  end

  private

  def params_planet
    params.require(:planet).permit(:name, :planet_type, :summary, :inhabitants,
                                   :available_places, :location, :catch_phrase,
                                   :price, photos: [])
  end

  def set_planet
    @planet = Planet.find(params[:id])
  end
end
