class BookingController < ApplicationController
    before_action :set_user
    before_action :set_booking, only: [:edit, :update, :destroy]
  
    def index
      @bookings = Booking.all
    end
  
    def new
      @booking = Booking.new
    end
  
    def create
      @booking = Bookings.new(booking_params)
      @booking.user = @user
      if @booking.save
        redirect_to bookings_path
      else
        render 'new'
      end
    end
  
    def edit
    end
  
    def update
      if @booking.update(booking_params)
        redirect_to bookings_path
      else
        render 'edit'
      end
    end
  
    def destroy
      @booking.destroy
      redirect_to bookings_path
    end
  
    private
  
    def booking_params
      params.require(:booking).permit(:comment, :grade).merge(planet_id: params[:planet_id])
    end
  
    def set_user
      @user = current_user
    end
    def set_booking
      @booking = Booking.find(params[:id])
    end
end
