class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]

  def index
    @bookings = current_user.bookings
    @upcomming_bookings = current_user.bookings.upcomming
    @past_bookings = current_user.bookings.past
  end

  def create
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new(booking_params)
    @booking.planet = @planet
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render "planets/show", status: :unprocessable_entity
    end
  end
  def show
    @booking = Booking.find(params[:id])
    @planet = @booking.planet
    @reviews = @planet.reviews
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
    redirect_to bookings_path, notice: 'Booking was successfully destroyed.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
