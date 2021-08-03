class BookingsController < ApplicationController

def create
  @doghome = Doghome.find(params[:doghome_id])
  @booking = Booking.new(booking_params)
  @booking.doghome = @doghome
  @booking.user = current_user
  @booking.total_price = (@booking.start_date - @booking.end_date).to_f * @booking.doghome.price_per_day.to_f
  @booking.save!
end


private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
