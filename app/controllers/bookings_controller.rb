class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @planet = Planet.find(params[:planet_id])
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user = @user
    if @booking.save
      redirect_to new_planet_booking_path(@planet)
    else
      render planet_bookings_path, status: :unprocessable_entity
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
