class BookingsController < ApplicationController

def create
  @doghome = Doghome.find(params[:doghome_id])
  @booking = Booking.new(booking_params)
  @booking.doghome = @doghome
  @booking.user = current_user
  @booking.total_price = ((@booking.end_date - @booking.start_date).to_f * @booking.doghome.price_per_day.to_f).round(2)
  @booking.save!
  redirect_to booking_path(@booking)
end

def show
  @booking = Booking.find(params[:id])
end

private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :booking_id)
  end
end
