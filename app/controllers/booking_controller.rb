class BookingController < ApplicationController
  def index
    @booking = Booking.new
  end
  
  def create
    begin
      @booking = Booking.new params[:booking]
      @booking.save!
    rescue ArgumentError => ae
      logger.error(ae)
      flash[:error] = I18n.t "datetime.errors.invalid"
      render :index
    rescue ActiveRecord::ActiveRecordError => e
      logger.error(e)
      render :index
    else
      flash[:success] = I18n.t "booking.messages.succes"
      logger.debug "booking.date: #{@booking.date}"
      redirect_to booking_index_path
    end
  end
end
