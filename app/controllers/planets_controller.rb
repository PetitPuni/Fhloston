class PlanetsController < ApplicationController
  before_action :params_planet, only(:show, :edit, :delete)

  def index
    @planets = Planet.all
  end

  def show
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(params_planet)
    @planet.user = @user
    if @planet.save
      redirect_to #
    else
      render new_planet_path, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def params_planet
    params.require(:planet).permit(:name)
  end

end
