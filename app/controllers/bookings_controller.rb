class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def create
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new
    @booking.planet = @planet
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path(@planet)
    else
      render "planets/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking.planets
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private

  def booking_params
    params.require(:booking).permit(:comment, :grade)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
